import 'package:flutter/material.dart';
import 'package:muslim_guide/args/allah_name_args.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/data/app_data/allah_names_data.dart';
import 'package:muslim_guide/routes.dart';
import 'package:muslim_guide/widgets/allah_name_card.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class AllahNamesScreen extends StatelessWidget {
  const AllahNamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: CustomAppBar(title: allahNamesTitle),
      body: Container(
        decoration: kSecondaryBackgroundBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(smallDimens),
          child: GridView.count(
            childAspectRatio: _isPortrait ? 4 / 3 : 3 / 2,
            crossAxisCount: _isPortrait ? 2 : 3,
            shrinkWrap: true,
            children: allahNames
                .map((e) => AllahNameCard(
                      allahName: e,
                      onNameTap: () => Navigator.of(context).pushNamed(
                        allahNameDetailsScreen,
                        arguments: AllahNameArgs(e),
                      ),
                    ))
                .toList(growable: false),
          ),
        ),
      ),
    );
  }
}
