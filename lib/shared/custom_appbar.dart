import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/styles.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  CustomAppBar({
    @required this.title,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      iconTheme: IconThemeData(color: kTextColor),
      flexibleSpace: Container(decoration: kSecondaryBackgroundBoxDecoration),
      title: Text(title, style: Theme.of(context).textTheme.headline5),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
