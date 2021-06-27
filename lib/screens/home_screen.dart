import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/constants/strings.dart' as strings;
import 'package:muslim_guide/constants/styles.dart' as styles;
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/widgets/quran/custom_quran_textview.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';
import 'package:muslim_guide/data/models/custom_ayah/custom_ayah.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String ayah = 'أُو۟لَـٰٓئِكَ عَلَىٰ هُدًى مِّن ربهم والئك هم المفلحون';

  @override
  void initState() {
    super.initState();
    prepareFile();
  }

  var customPages = CustomAyah();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: strings.homeScreenTitle, centerTitle: true),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: styles.kSecondaryBackgroundBoxDecoration,
        child: Column(
          children: [
            /*Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: dimens.mediumPadding,
                vertical: dimens.smallPadding,
              ),
              child: RandomAyah(ayah: ayah),
            ),*/
            // Expanded(child: CategoryList()),
            CustomQuranTextView(customAyah: customPages),
          ],
        ),
      ),
    );
  }

  Future<void> prepareFile() async {
    final h = '@@ $runtimeType @@ prepareFile() >>';
    final customPageContent =
        await rootBundle.loadString(customPageContentFile);
    customPages = customAyahFromJson(customPageContent)[0];

    mLog('$h customAyah= \n${jsonEncode(customPages)}');
  }
}
