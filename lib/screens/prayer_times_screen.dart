import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/data/floor/operations/prayer_operations.dart';
import 'package:muslim_guide/helpers/app/after_layout.dart';
import 'package:muslim_guide/helpers/app/app_dialogs.dart';
import 'package:muslim_guide/helpers/app/app_helper.dart';
import 'package:muslim_guide/helpers/prayer_helper.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';
import 'package:muslim_guide/services/location_service.dart';
import 'package:muslim_guide/widgets/prayer_times/hijri_date.dart';
import 'package:muslim_guide/widgets/prayer_times/praye_times_list.dart';
import 'package:muslim_guide/widgets/prayer_times/prayer_location.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';
import 'package:provider/provider.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({
    Key? key,
  }) : super(key: key);

  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen>
    with AfterLayoutMixin {
  late PrayerTimesProvider _updatedPrayerProvider;
  late PrayerTimesProvider _prayerProvider;
  final PrayerHelper _prayerHelper = PrayerHelper.instance;

  @override
  void initState() {
    super.initState();
    _prayerProvider = Provider.of<PrayerTimesProvider>(context, listen: false);
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    Fimber.i('curLocation = ${_prayerProvider.curLocation}');
    await prepareLocationToGetTimes(context);
  }

  Future<void> prepareLocationToGetTimes(BuildContext context) async {
    _updatedPrayerProvider.isLoading = true;
    // save today prayer times
    await _prayerHelper.savePrayerEntity(_prayerProvider);
    if (_prayerProvider.prayerEntity == null) {
      if (_prayerProvider.curLocation == null) {
        await saveLocation(context, _prayerProvider);
      }
      await getPrayerTimesCall();
    } else {
      Fimber.i('prayerEntity != null');
    }
    _updatedPrayerProvider.isLoading = false;
  }

  Future<void> getPrayerTimesCall() async {
    Fimber.i('-');
    final isInternet = await checkInternet();
    if (isInternet) {
      Fimber.i(
          '_prayerProvider.prayerEntity  = ${_prayerProvider.prayerEntity}');
      await _prayerHelper.getPrayerTimes(
        provider: _prayerProvider,
        context: context,
      );
    } else {
      await noInternetDialog(context);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    _updatedPrayerProvider = Provider.of<PrayerTimesProvider>(context);
    Fimber.i('curLocation = ${_updatedPrayerProvider.curLocation}');

    return Scaffold(
      appBar: CustomAppBar(title: prayerTimesTitle),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onLocationPressed(context),
        child: const Icon(
          Icons.my_location,
          color: kTextColor,
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: LoadingOverlay(
        isLoading: _updatedPrayerProvider.isLoading,
        progressIndicator: simpleProgressIndicator,
        color: kModalProgressColor,
        child: Container(
          width: double.infinity,
          decoration: kSecondaryBackgroundBoxDecoration,
          child: _updatedPrayerProvider.prayerEntity != null
              ? Column(
                  children: [
                    HijriDate(prayerTimesProvider: _updatedPrayerProvider),
                    Expanded(
                      child: PrayerTimesList(
                        prayerTimesProvider: _updatedPrayerProvider,
                      ),
                    ),
                    // _updatedPrayerProvider.prayerEntity?.lng != null
                    PrayerLocation(prayerTimesProvider: _updatedPrayerProvider)
                    // : const SizedBox(),
                  ],
                )
              : const SizedBox(
                  height: double.infinity,
                ),
        ),
      ),
    );
  }

  Future<void> onLocationPressed(BuildContext context) async {
    final isYes = await takeActionDialog(
      context: context,
      msg: locationChangeConfirm,
    );
    if (isYes) {
      _prayerProvider.resetData();
      await PrayerOperations.instance.deleteAllData();
      await prepareLocationToGetTimes(context);
    }
  }
}
