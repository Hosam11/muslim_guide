import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/shared/custom_appbar.dart';
import 'package:muslim_guide/widgets/categories/category_list.dart';
import 'package:muslim_guide/widgets/random_ayah.dart';

class HomeScreen extends StatelessWidget {
  final String ayah =
      'وَمَنْ أَعْرَضَ عَن ذِكْرِي فَإِنَّ لَهُ مَعِيشَةً ضَنكًا وَنَحْشُرُهُ يَوْمَ الْقِيَامَةِ أَعْمَىٰ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: homeScreenTitle, centerTitle: true),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kSecondaryBackgroundBoxDecoration,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: mediumPadding,
                vertical: smallPadding,
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
