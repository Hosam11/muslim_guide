import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/assets.dart' as assets;
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/constants/strings.dart' as strings;
import 'package:muslim_guide/routes.dart' as routes;
import 'package:muslim_guide/widgets/categories/category_card_item.dart';

List<CategoryCardItem> _getGridItems(BuildContext context) => [
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
      ),
      CategoryCardItem(
        title: strings.azkarNightTitle,
        icon: assets.azkarNigthImg,
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

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Padding(
      padding: const EdgeInsets.all(dimens.smallPadding),
      child: GridView.count(
        childAspectRatio: _isPortrait ? 4 / 3 : 3 / 2,
        crossAxisCount: _isPortrait ? 2 : 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        children: _getGridItems(context),
      ),
    );
  }
}
