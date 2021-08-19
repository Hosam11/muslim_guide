import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/models/allah_names/allah_names.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class AllahNameDetailsScreen extends StatelessWidget {
  const AllahNameDetailsScreen({
    Key? key,
    required this.allahNames,
  }) : super(key: key);
  final AllahName allahNames;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: allahNames.name, centerTitle: true),
        body: Container(
          decoration: kSecondaryBackgroundBoxDecoration,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(smallDimens),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: kSmallBorderRadius,
                      border: kWhiteBorder,
                      color: kPrimaryColor,
                    ),
                    padding: const EdgeInsets.all(smallDimens),
                    child: Text(
                      allahNames.meaning,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
