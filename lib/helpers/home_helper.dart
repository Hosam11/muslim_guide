import 'package:flutter/material.dart';
import 'package:muslim_guide/args/azkar_args.dart';
import 'package:muslim_guide/constants/assets.dart' as assets;
import 'package:muslim_guide/constants/strings.dart' as strings;
import 'package:muslim_guide/routes.dart' as routes;
import 'package:muslim_guide/widgets/categories/category_card_item.dart';

List<CategoryCardItem> getGridItems(BuildContext context) => [
      CategoryCardItem(
        title: strings.quranTitle,
        icon: assets.quranImg,
        onTapped: () => Navigator.pushNamed(context, routes.quranScreen),
      ),
      CategoryCardItem(
        title: strings.allahNamesTitle,
        icon: assets.allahNamesImg,
      ),
      CategoryCardItem(
        title: strings.azkarMorningTitle,
        icon: assets.azkarMorningImg,
        onTapped: () => onAzkarPressed(false, context),
      ),
      CategoryCardItem(
        title: strings.azkarNightTitle,
        icon: assets.azkarNigthImg,
        onTapped: () => onAzkarPressed(true, context),
      ),
      CategoryCardItem(
        title: strings.prayerTimesTitle,
        icon: assets.prayerTimesImg,
      ),
      CategoryCardItem(
        title: strings.rosaryTitle,
        icon: assets.rosaryImg,
      ),
    ];

void onAzkarPressed(bool isNight, BuildContext context) {
  // get list of azkar

  Navigator.pushNamed(
    context,
    routes.azkarScreen,
    arguments: AzkarArgs(isNight),
  );
}
