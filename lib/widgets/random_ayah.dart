import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/constants/styles.dart' as styles;

class RandomAyah extends StatelessWidget {
  const RandomAyah({@required this.ayah});
  final String ayah;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // decoration: ,
      decoration: styles.kPrimaryBackgroundBoxDecoration.copyWith(
        borderRadius: styles.kSmallBorderRadius,
        border: styles.kWhiteBorder,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: dimens.mediumPadding,
          right: dimens.mediumPadding,
          left: dimens.mediumPadding,
          bottom: dimens.smallPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// todo: check in ayahLength to avoid ugly view in design
            AutoSizeText(
              ayah,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            Text(
              '"طة"',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
