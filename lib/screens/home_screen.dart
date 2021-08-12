import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/models/custom_ayah/ayah_content.dart';
import 'package:muslim_guide/helpers/after_layout.dart';
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/services/location_service.dart';
import 'package:muslim_guide/widgets/categories/category_list.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

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
    Fimber.i('');
    await getLocation();
  }

  var customPages = AyahContent();

  @override
  Widget build(BuildContext context) {
    Fimber.i('');

    var dateToday = DateTime.now();
    Fimber.i('dateToday= $dateToday  ');
    return Scaffold(
      appBar: CustomAppBar(title: homeScreenTitle, centerTitle: true),
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

  Future<void> getLocation() async {
    final res = await getUserLocation(context);
    Fimber.i('res= $res');
    if (res is! bool) {
      await saveLocationToPrefs(res);
    } else {
      // error try again
      // await getLocationPressed();
    }
  }
}
