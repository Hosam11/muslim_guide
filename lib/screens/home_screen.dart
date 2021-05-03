import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/routes.dart' as routes;
import 'package:muslim_guide/widgets/custom_appbar.dart';
import 'package:muslim_guide/widgets/grid_item.dart';

const int gridCount = 2;
const int listCount = 5;


List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  // cross -> horizontal axis -- main -> vertical axis
  StaggeredTile.count(1, 1),
  StaggeredTile.count(1, 1),
  StaggeredTile.count(1, 1),
  StaggeredTile.count(1, 1),
  StaggeredTile.count(2, 1),
];

class HomeScreen extends StatelessWidget {
  List<GridItem> _getGridItems(BuildContext context) {
    final List<GridItem> items = [];

    items.add(
      GridItem(
        title: 'القرءان الكريم',
        icon: 'assets/icons/quran.png',
        onTapped: () => Navigator.pushNamed(context, routes.quranScreen),
      ),
    );

    items.add(GridItem(
      title: 'الاحاديث الشريفه',
      icon: 'assets/icons/hadith.png',
    ));

    items.add(GridItem(
      title: 'المسبحه',
      icon: 'assets/icons/rosary.png',
    ));
    items.add(GridItem(
      title: 'مواقيت الصلاه',
      icon: 'assets/icons/pray.png',
    ));
    items.add(GridItem(
      title: 'اذكار الصباح والمساء',
      icon: 'assets/icons/praying.png',
    ));

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: homeScreenTitle, centerTitle: true),
      body: Container(
        decoration: kBackgroundBoxDecoration,
        child: Column(
          children: [
            Expanded(
              child: StaggeredGridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(mediumPadding),
                shrinkWrap: true,
                staggeredTiles: _staggeredTiles,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: _getGridItems(context),
              ),
            ),

            // list
          ],
        ),
      ),
    );
  }
}
