import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/helpers/home_helper.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Padding(
      padding: const EdgeInsets.all(dimens.smallDimens),
      child: GridView.count(
        childAspectRatio: _isPortrait ? 4 / 3 : 3 / 2,
        crossAxisCount: _isPortrait ? 2 : 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        children: categoriesList(context),
      ),

      //   },
      // ),
    );
  }
}
