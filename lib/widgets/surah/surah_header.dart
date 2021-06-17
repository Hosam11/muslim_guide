import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/constants/styles.dart' as styles;

class SurahHeader extends StatelessWidget {
  final String surahName;

  // support string and integer
  final dynamic juzName;

  const SurahHeader({
    Key key,
    @required this.surahName,
    @required this.juzName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: dimens.smallestPadding,
        horizontal: dimens.smallPadding,
      ),
      decoration: BoxDecoration(
        border: styles.kWhiteBorder,
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            juzName is num ? juzName.toString() : juzName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            surahName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
