import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart' as colors;
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/constants/strings.dart' as strings;
import 'package:muslim_guide/constants/styles.dart' as styles;
import 'package:muslim_guide/data/app_data/surahs_data.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class SurahsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: strings.quranScreenTitle),
      body: Container(
        decoration: styles.kSecondaryBackgroundBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.only(
            left: dimens.mediumDimens,
            right: dimens.mediumDimens,
            top: dimens.mediumDimens,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: colors.kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(dimens.smallDimens),
                topRight: Radius.circular(dimens.smallDimens),
              ),
            ),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, index) => surahsItems[index],
              itemCount: surahsItems.length,
              padding: const EdgeInsets.all(dimens.smallDimens),
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
