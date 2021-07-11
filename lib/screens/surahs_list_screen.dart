import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart' as colors;
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/constants/strings.dart' as strings;
import 'package:muslim_guide/constants/styles.dart' as styles;
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class SurahsListScreen extends StatelessWidget {
  final AppHelper _appHelper = AppHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: strings.quranScreenTitle),
      body: Container(
        decoration: styles.kSecondaryBackgroundBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.only(
            left: dimens.mediumPadding,
            right: dimens.mediumPadding,
            top: dimens.mediumPadding,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: colors.kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(dimens.smallPadding),
                topRight: Radius.circular(dimens.smallPadding),
              ),
            ),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, index) => _appHelper.surahsItems[index],
              itemCount: _appHelper.surahsItems.length,
              padding: const EdgeInsets.all(dimens.smallPadding),
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
