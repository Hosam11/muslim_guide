import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/routes.dart';
import 'package:muslim_guide/widgets/categories/category_card_item.dart';

List<CategoryCardItem> _getGridItems(BuildContext context) => [
      CategoryCardItem(
        title: quranTitle,
        icon: quranImg,
        onTapped: () => Navigator.pushNamed(context, quranScreen),
      ),
      CategoryCardItem(
        title: allahNamesTitle,
        icon: allahNamesImg,
      ),
      CategoryCardItem(
        title: azkarMorningTitle,
        icon: azkarMorningImg,
      ),
      CategoryCardItem(
        title: azkarNightTitle,
        icon: azkarNigthImg,
      ),
      CategoryCardItem(
        title: prayerTimesTitle,
        icon: prayerTimesImg,
      ),
      CategoryCardItem(
        title: rosaryTitle,
        icon: rosaryImg,
      ),
    ];

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Fimber.i('headText6 = ${Theme.of(context).textTheme.headline6.fontSize}');
    Fimber.i('headText5 = ${Theme.of(context).textTheme.headline5.fontSize}');
    Fimber.i('subtitle1 = ${Theme.of(context).textTheme.subtitle1.fontSize}');
    Fimber.i('subtitle2 = ${Theme.of(context).textTheme.subtitle2.fontSize}');
    Fimber.i('bodyText1 = ${Theme.of(context).textTheme.bodyText1.fontSize}');
    Fimber.i('bodyText2 = ${Theme.of(context).textTheme.bodyText2.fontSize}');
    Fimber.i('caption = ${Theme.of(context).textTheme.caption.fontSize}');
    final bool _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Padding(
      padding: const EdgeInsets.all(smallPadding),
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
