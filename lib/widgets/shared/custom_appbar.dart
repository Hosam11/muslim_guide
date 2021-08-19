import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/styles.dart' as styles;

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  CustomAppBar({
    required this.title,
    this.centerTitle = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      iconTheme: const IconThemeData(color: kTextColor),
      flexibleSpace:
          Container(decoration: styles.kSecondaryBackgroundBoxDecoration),
      title: Text(title, style: Theme.of(context).textTheme.headline5),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
