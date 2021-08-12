import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/app_data/surahs_data.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class SurahsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: quranScreenTitle),
      body: Container(
        decoration: kSecondaryBackgroundBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.only(
            left: mediumDimens,
            right: mediumDimens,
            top: mediumDimens,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(smallDimens),
                topRight: Radius.circular(smallDimens),
              ),
            ),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, index) => surahsItems[index],
              itemCount: surahsItems.length,
              padding: const EdgeInsets.all(smallDimens),
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ),
      ),
    );
  }
}
