import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:muslim_guide/screens/quran_screen.dart';
import 'package:muslim_guide/widgets/custom_appbar.dart';
import 'package:muslim_guide/widgets/grid_item.dart';

import '../constants.dart';

const int gridCount = 2;
const int listCount = 5;
const String screenTitle = 'الرئيسية';
const String appTitle = 'دليل المسلم';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  // cross -> horizontal axis -- main -> vertical axis
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 1),
];

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  List<GridItem> _getGridItems(BuildContext context) {
    List<GridItem> items = [];

    items.add(GridItem(
      title: 'القرءان الكريم',
      icon: 'assets/icons/quran.png',
      onTapped: () => Navigator.pushNamed(context, QuranScreen.id),
    ));

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
      appBar: CustomAppBar(title: screenTitle, centerTitle: true),
      body: Container(
        decoration: kBackgroundBoxDecoration,
        child: Column(
          children: [
            Expanded(
              child: StaggeredGridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                children: _getGridItems(context),
                shrinkWrap: true,
                staggeredTiles: _staggeredTiles,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),

            // list
          ],
        ),
      ),
    );
  }
}
