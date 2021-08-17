import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/data/floor/operations/prayer_operations.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_times_model.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_timings.dart';
import 'package:muslim_guide/data/repository/prayer_times_repo.dart';
import 'package:muslim_guide/data/shared_prefs/perfs.dart';
import 'package:muslim_guide/data/shared_prefs/perfs_keys.dart';
import 'package:muslim_guide/helpers/app/app_dialogs.dart';
import 'package:muslim_guide/helpers/app/arabic_numbers.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';
import 'package:muslim_guide/services/util/urls.dart';
import 'package:muslim_guide/widgets/prayer_time_card.dart';

class PrayerHelper {
  PrayerHelper._privateConstructor();

  final now = DateTime.now();

  static final PrayerHelper instance = PrayerHelper._privateConstructor();
  final PrayerOperations _prayerOperations = PrayerOperations.instance;

  Future<void> getPrayerTimes({
    required PrayerTimesProvider provider,
    required BuildContext context,
  }) async {
    final url = prayerTimesUrl(
      lat: provider.curLocation!.latitude,
      lng: provider.curLocation!.longitude,
      month: now.month,
      year: now.year,
    );
    final timesModel = await PrayerTimesRepo.instance.getPrayerTimes(url);
    if (timesModel.code == 200) {
      final saveMonthNum = await setInt(value: now.day, key: monthNumberKey);
      Fimber.i('saveMonthNum= $saveMonthNum');
      // save it in provider
      // save it in db
      await saveDate(timesModel, provider);
    } else {
      // display error pop screen
      provider.resetData();
      await showInfoDialog(context, errorHappened);
      Navigator.pop(context);
    }
    Fimber.i('timesModel = $timesModel');
  }

  Future<void> saveDate(
    PrayerTimesModel timesModel,
    PrayerTimesProvider provider,
  ) async {
    Fimber.i('-');

    // get prayer of current day and save it in provider
    provider.prayerTimings =
        timesModel.prayerDataList?[now.day - 1].prayerTimes;
    // save it in db
    final prayerTimes = timesModel.prayerDataList;
    // assign day number to each object of prayerTimes
    for (var index = 0; index < prayerTimes!.length; ++index) {
      prayerTimes[index].prayerTimes.dayNumber = index + 1;
    }
    final times = prayerTimes.map((e) => e.prayerTimes).toList(growable: false);
    await _prayerOperations.insertPrayerTimes(times);
  }

  String? _convert24To12(String s) {
    // 20:22 (EET)
    final timeStr = s.split(' ')[0];
    // 20:22
    final status;
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
    Fimber.i('finalHour= ${finalHour}, minutes = ${minutes}');
    return '${convertToArabic(finalHour)}:${convertToArabic(minutes)} $status';
  }

  String _addZerosToTime(int i) {
    return i <= 9 ? '0$i' : i.toString();
  }

  List<PrayerTimesCard> prayerList(PrayerTimings prayerTimings) {
    final namesList = [fajr, sunrise, dhuhr, asr, maghrib, isha];
    final imgNamesList = [
      fajrImg,
      sunriseImg,
      noonImg,
      afternoonImg,
      fajrImg,
      nightImg
    ];
    final prayerTimeStrs = _formatedTimes(prayerTimings);
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

  List<String> _formatedTimes(PrayerTimings prayerTimings) {
    final fajr = _convert24To12(prayerTimings.fajr!)!;
    final sunrise = _convert24To12(prayerTimings.sunrise!)!;
    final dhuhr = _convert24To12(prayerTimings.dhuhr!)!;
    final asr = _convert24To12(prayerTimings.asr!)!;
    final maghrib = _convert24To12(prayerTimings.maghrib!)!;
    final isha = _convert24To12(prayerTimings.isha!)!;
    return [fajr, sunrise, dhuhr, asr, maghrib, isha];
  }
}
