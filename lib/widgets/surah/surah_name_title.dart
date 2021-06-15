import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/styles.dart' as styles;
import 'package:muslim_guide/constants/dimens.dart';

class SurahNameTitle extends StatelessWidget {
  const SurahNameTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: smallPadding),
      child: Container(
        // decoration: styles.kPrimaryBackgroundBoxDecoration.copyWith(
        decoration: BoxDecoration(
          // borderRadius: styles.kSmallBorderRadius,
          color: kPrimaryColor,
          boxShadow: [styles.shadowFromColor(kPrimaryColor)],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '',
              style: Theme.of(context).textTheme.headline5,
            ),
            Center(
              child: Text('الفاتحة2',
                  style: Theme.of(context).textTheme.headline5),
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
