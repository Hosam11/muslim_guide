import 'package:flutter/material.dart';

import '../constants/styles.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  CustomAppBar({@required this.title, this.centerTitle = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      iconTheme: const IconThemeData(color: kPrimaryColor),
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: kBackgroundBoxDecoration,
      ),
      title: Text(
        title,
        style: kScreenTitleStyle,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
