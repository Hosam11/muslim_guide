import 'package:flutter/material.dart';
import 'package:muslim_guide/args/azkar_args.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/routes.dart';
import 'package:muslim_guide/widgets/categories/category_card_item.dart';

List<CategoryCardItem> categoriesList(
  BuildContext context,
) =>
    [
      CategoryCardItem(
        title: quranTitle,
        imgName: quranImg,
        onTapped: () => Navigator.pushNamed(context, quranScreen),
      ),
      CategoryCardItem(
        title: allahNamesTitle,
        imgName: allahNamesImg,
        onTapped: () => Navigator.of(context).pushNamed(allahNamesScreen),
      ),
      CategoryCardItem(
        title: azkarMorningTitle,
        imgName: azkarMorningImg,
        onTapped: () => onAzkarPressed(false, context),
      ),
      CategoryCardItem(
        title: azkarNightTitle,
        imgName: azkarNigthImg,
        onTapped: () => onAzkarPressed(true, context),
      ),
      CategoryCardItem(
        title: prayerTimesTitle,
        imgName: prayerTimesImg,
        onTapped: () => Navigator.pushNamed(
          context,
          prayersTimesScreen,
        ),
      ),
      CategoryCardItem(
        title: rosaryTitle,
        imgName: rosaryImg,
        onTapped: () => Navigator.of(context).pushNamed(rosaryScreen),
      ),
    ];

void onAzkarPressed(bool isNight, BuildContext context) {
  // get list of azkar
  Navigator.pushNamed(
    context,
    azkarScreen,
    arguments: AzkarArgs(isNight),
  );
}
