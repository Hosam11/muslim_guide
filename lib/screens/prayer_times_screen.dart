import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/helpers/app/after_layout.dart';
import 'package:muslim_guide/helpers/app/app_dialogs.dart';
import 'package:muslim_guide/helpers/app/app_helper.dart';
import 'package:muslim_guide/helpers/prayer_helper.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';
import 'package:muslim_guide/services/location_service.dart';
import 'package:muslim_guide/widgets/prayer_times/praye_times_list.dart';
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

    _updatedPrayerProvider.isLoading = true;
    await saveLocation(context, _prayerProvider);
    await getPrayerTimesCall();
    _updatedPrayerProvider.isLoading = false;
  }

  Future<void> getPrayerTimesCall() async {
    Fimber.i('-');

    final isInternet = await checkInternet();
    if (isInternet) {
      if (_prayerProvider.curLocation != null) {
        // todo: not good, leave it for now
        if (_prayerProvider.prayerTimings == null) {
          Fimber.i(
              '_prayerProvider.prayerTimings  = ${_prayerProvider.prayerTimings}');
          await _prayerHelper.getPrayerTimes(
            provider: _prayerProvider,
            context: context,
          );
        }
      }
    } else {
      await noInternetDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    _updatedPrayerProvider = Provider.of<PrayerTimesProvider>(context);
    Fimber.i('curLocation = ${_updatedPrayerProvider.curLocation}');
    return Scaffold(
      appBar: CustomAppBar(title: prayerTimesTitle),
      body: LoadingOverlay(
        isLoading: _updatedPrayerProvider.isLoading,
        progressIndicator: simpleProgressIndicator,
        color: kModalProgressColor,
        child: Container(
          // height: double.infinity,
          width: double.infinity,
          decoration: kSecondaryBackgroundBoxDecoration,
          child: Column(
            children: [
              _updatedPrayerProvider.curLocation != null
                  ? Expanded(
                      child: PrayerTimesList(
                          prayerTimesProvider: _updatedPrayerProvider),
                    )
                  // : NoLocation(onTryAgainPress: tryGetLocation),
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
