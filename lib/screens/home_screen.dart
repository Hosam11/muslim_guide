import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/data/models/custom_ayah/ayah_content.dart';
import 'package:muslim_guide/data/shared_prefs/perfs.dart';
import 'package:muslim_guide/helpers/app/after_layout.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';
import 'package:muslim_guide/services/location_service.dart';
import 'package:muslim_guide/widgets/categories/category_list.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AfterLayoutMixin {
  final String ayah = 'أُو۟لَـٰٓئِكَ عَلَىٰ هُدًى مِّن ربهم والئك هم المفلحون';

  @override
  void initState() {
    Fimber.i('');
    super.initState();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    final prayerProvider =
        Provider.of<PrayerTimesProvider>(context, listen: false);
    Fimber.i('');
    // final location = getLocationFromPref();
    // false means there is no location stored in db
    if (prayerProvider.curLocation == null) {
      await getLocationAndSaveIt(context, prayerProvider);
    } else {
      // Fimber.i('there is location stored= $location');
    }
  }

  var customPages = AyahContent();

  Future<void> test() async {
    /* await takeActionDialog(
      context: context,
      msg: locationNoEnable,
      positiveBtnStr: openSetting,
      negativeBtnStr: cancel,
    );
    await testDialog(context);*/

    final clear = await clearPrefs();
    final prayerProvider =
        Provider.of<PrayerTimesProvider>(context, listen: false);
    prayerProvider.curLocation = null;
    Fimber.i('clear= $clear');
  }

  @override
  Widget build(BuildContext context) {
    Fimber.i('');
    var dateToday = DateTime.now();
    Fimber.i('dateToday= $dateToday  ');
    return Scaffold(
      appBar: CustomAppBar(title: homeScreenTitle, centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: test,
        child: const Icon(Icons.clear),
      ),
      body: Container(
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
    );
  }

/*  Future<void> getLocationAndSaveIt() async {
    final res = await getUserLocation(context);
    Fimber.i('res= $res');
    if (res is! bool) {
      await saveLocationToPrefs(res);
    }
  }*/

}
