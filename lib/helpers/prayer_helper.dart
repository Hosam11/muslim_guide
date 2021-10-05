import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/data/floor/entities/prayer_entity.dart';
import 'package:muslim_guide/data/floor/operations/prayer_operations.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_times_model.dart';
import 'package:muslim_guide/data/repository/prayer_times_repo.dart';
import 'package:muslim_guide/helpers/app/app_dialogs.dart';
import 'package:muslim_guide/helpers/app/arabic_numbers.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';
import 'package:muslim_guide/services/util/urls.dart';
import 'package:muslim_guide/widgets/prayer_time_card.dart';

class PrayerHelper {
  PrayerHelper._privateConstructor();

  static final PrayerHelper instance = PrayerHelper._privateConstructor();
  final PrayerOperations _prayerOperations = PrayerOperations.instance;

  ///
  Future<void> getPrayerTimes({
    required PrayerTimesProvider provider,
    required BuildContext context,
  }) async {
    final now = DateTime.now();

    final url = prayerTimesUrl(
      lat: provider.curLocation!.latitude,
      lng: provider.curLocation!.longitude,
      month: now.month,
      year: now.year,
    );
    final timesModel = await PrayerTimesRepo.instance.getPrayerTimes(url);
    if (timesModel.code == 200) {
      // final saveMonthNum = await setInt(value: now.month, key: monthNumberKey);
      Fimber.i('monthNum= ${now.month}');
      // save it in provider
      // save it in db
      await saveDateInDB(timesModel, provider);
    } else {
      // display error pop screen
      // provider.resetData();
      await showInfoDialog(context, errorHappened);
      Navigator.pop(context);
    }
    Fimber.i('timesModel = $timesModel');
  }

  Future<void> saveDateInDB(
    PrayerTimesModel timesModel,
    PrayerTimesProvider provider,
  ) async {
    Fimber.i('-');
    // save it in db
    final prayerTimes = timesModel.prayerDataList;
    Fimber.i(' prayerTimesLen= ${prayerTimes.length}');
    final prayerEntities = <PrayerEntity>[];
    for (var index = 0; index < prayerTimes.length; index++) {
      final prayerTimesData = prayerTimes[index];
      final prayerEntity = prayerEntityFromPrayerData(
        data: prayerTimesData,
        dayNumber: index + 1,
      );
      prayerEntities.add(prayerEntity);
    }
    final now = DateTime.now();

    // get prayer of current day and save it in provider
    provider.prayerEntity = prayerEntities[now.day - 1];
    await _prayerOperations.insertPrayerEntities(prayerEntities);
  }

  Future<void> savePrayerEntity(
    PrayerTimesProvider provider,
  ) async {
    /// check current month with month in db

    final nowDate = DateTime.now();
    final curPrayerEntity =
        await _prayerOperations.getPrayerEntity(nowDate.day);
    Fimber.i('curPrayerEntity= $curPrayerEntity');
    if (curPrayerEntity != null) {
      provider.prayerEntity = curPrayerEntity;

      final dbDate = dateFromTimeStamp(curPrayerEntity.timestamp);

      Fimber.i('dbDate= $dbDate');
      Fimber.i('dbDate.month = ${dbDate.month}');
      Fimber.i('nowDate.month= ${nowDate.month}');
      // todo make it !=, "==" only to test different month
      if (dbDate.month != nowDate.month) {
        Fimber.i('not same month');

        /// clean data base so in [PrayerTimesScreen] get data again from api
        await _prayerOperations.deleteAllData();
        provider.resetData();
      }
      Fimber.i('curPrayerEntity= $curPrayerEntity');
    } else {
      Fimber.i('curPrayerEntity is null');
    }
  }

  List<PrayerTimesCard> prayerList(PrayerEntity? prayerTimings) {
    if (prayerTimings == null) {
      return [];
    }
    final namesList = [fajr, sunrise, dhuhr, asr, maghrib, isha];
    final imgNamesList = [
      fajrImg,
      sunriseImg,
      noonImg,
      afternoonImg,
      fajrImg,
      nightImg
    ];
    final prayerTimeStrs = _formattedTimes(prayerTimings);
    final timesWidgets = <PrayerTimesCard>[];
    for (var index = 0; index < namesList.length; ++index) {
      final prayerName = namesList[index];
      final prayerImg = imgNamesList[index];
      final prayerTime = prayerTimeStrs[index];
      final prayerWidget = PrayerTimesCard(
        img: prayerImg,
        prayerName: prayerName,
        prayerTime: prayerTime,
      );
      timesWidgets.add(prayerWidget);
    }
    return timesWidgets;
  }

  DateTime dateFromTimeStamp(String timestamp) {
    final intTimestamp = int.parse(timestamp) * 1000;
    final date = DateTime.fromMillisecondsSinceEpoch(intTimestamp);
    return date;
  }

  String getHijriDate(DateTime date) {
    final hijri = HijriCalendar.fromDate(date);
    final strDate = hijri.toFormat('dd MMMM yyyy');
    Fimber.i('strDate= $strDate');
    return strDate;
  }

  List<String> _formattedTimes(PrayerEntity prayerTimings) {
    final fajr = _convert24To12(prayerTimings.fajr);
    final sunrise = _convert24To12(prayerTimings.sunrise);
    final dhuhr = _convert24To12(prayerTimings.dhuhr);
    final asr = _convert24To12(prayerTimings.asr);
    final maghrib = _convert24To12(prayerTimings.maghrib);
    final isha = _convert24To12(prayerTimings.isha);
    return [fajr, sunrise, dhuhr, asr, maghrib, isha];
  }

  String _convert24To12(String s) {
    // 20:22 (EET)
    final timeStr = s.split(' ')[0];
    // 20:22
    final String status;
    var finalHour;
    final hour = int.parse(timeStr.split(':')[0]);
    dynamic minutes = int.parse(timeStr.split(':')[1]);
    if (hour > 12) {
      status = nightLetter;
      finalHour = hour - 12;
    } else {
      status = nightLetter;
      finalHour = hour;
    }
    finalHour = _addZerosToTime(finalHour);
    minutes = _addZerosToTime(minutes);
    Fimber.i('finalHour= $finalHour, minutes = $minutes');
    return '${convertToArabic(finalHour)}:${convertToArabic(minutes)} $status';
  }

  String _addZerosToTime(int i) => i <= 9 ? '0$i' : i.toString();
}
