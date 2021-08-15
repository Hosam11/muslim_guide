import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';

class PageTitle extends StatelessWidget {
  final String? left;

  // support string and integer
  final dynamic right;

  const PageTitle({
    Key? key,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(fontWeight: FontWeight.normal);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: smallestDimens,
        horizontal: smallDimens,
      ),
      decoration: pagePopupDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            right is num ? right.toString() : right,
            style: textStyle,
          ),
          Text(left!, style: textStyle),
        ],
      ),
    );
  }
}
