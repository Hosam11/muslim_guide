import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/constants/strings.dart' as strings;
import 'package:muslim_guide/constants/styles.dart' as styles;
import 'package:muslim_guide/helpers/quran_helper.dart';
import 'package:muslim_guide/shared/custom_appbar.dart';
import 'package:muslim_guide/widgets/categories/category_list.dart';
import 'package:muslim_guide/widgets/random_ayah.dart';

class HomeScreen extends StatelessWidget {
  final String ayah = 'أُو۟لَـٰٓئِكَ عَلَىٰ هُدًى مِّن ربهم والئك هم المفلحون';
  // 'وَمَنْ أَعْرَضَ عَن ذِكْرِي فَإِنَّ لَهُ مَعِيشَةً ضَنكًا وَنَحْشُرُهُ يَوْمَ الْقِيَامَةِ أَعْمَىٰ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: strings.homeScreenTitle, centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () => QuranHelper.instance.testPrepareQuranPageContents(603),
        child: Icon(Icons.add),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: styles.kSecondaryBackgroundBoxDecoration,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: dimens.mediumPadding,
                vertical: dimens.smallPadding,
              ),
              child: RandomAyah(ayah: ayah),
            ),
            Expanded(child: CategoryList()),
          ],
        ),
      ),
    );
  }
}
