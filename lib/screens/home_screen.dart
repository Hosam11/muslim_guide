import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_guide/bin/playstore_lookup.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/data/floor/operations/prayer_operations.dart';
import 'package:muslim_guide/data/shared_prefs/perfs.dart';
import 'package:muslim_guide/helpers/app/app_dialogs.dart';
import 'package:muslim_guide/helpers/app/app_helper.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';
import 'package:muslim_guide/widgets/categories/category_list.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

class HomeScreen extends StatelessWidget {
  final String ayah = 'أُو۟لَـٰٓئِكَ عَلَىٰ هُدًى مِّن ربهم والئك هم المفلحون';

  const HomeScreen({Key? key}) : super(key: key);

  Future<void> test(BuildContext context) async {
    final clear = await clearPrefs();
    final prayerProvider =
        Provider.of<PrayerTimesProvider>(context, listen: false);
    prayerProvider.curLocation = null;
    await PrayerOperations.instance.deleteAllData();
    prayerProvider.resetData();
    Fimber.i('clear= $clear');
  }

  void test2() {
    testPlay(['id=com.hossam.muslim_guide']);
  }

  @override
  Widget build(BuildContext context) {
    Fimber.i('');
    var dateToday = DateTime.now();
    Fimber.i('dateToday= $dateToday  ');

    return WillPopScope(
      onWillPop: () async {
        final dialogRes = await askExitApp(context);
        if (dialogRes) {
          await SystemChannels.platform
              .invokeMethod<dynamic>('SystemNavigator.pop');
        }
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(title: homeScreenTitle, centerTitle: true),
        // floatingActionButton: FloatingActionButton(
        //   // onPressed: () => test(context),
        //   onPressed: () => test2(),
        //   child: const Icon(Icons.clear),
        // ),
        body: UpgradeAlert(
          canDismissDialog: false,
          debugLogging: true,
          dialogStyle: UpgradeDialogStyle.cupertino,
          appcastConfig: cfg,
          messages: UpgraderMessages(code: 'ar'),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: kSecondaryBackgroundBoxDecoration,
            child: Column(
              children: [
                /*Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: mediumPadding,
                    vertical: smallPadding,
                  ),
                  child: RandomAyah(ayah: ayah),
                ),*/
                Expanded(child: CategoryList()),
                /*Expanded(
                  child: SingleChildScrollView(
                    child: CustomQuranTextView(customAyah: customPages),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
