import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';

class RandomAyah extends StatelessWidget {
  const RandomAyah({@required this.ayah});
  final String ayah;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // decoration: ,
      decoration: kPrimaryBackgroundBoxDecoration.copyWith(
        borderRadius: kSmallBorderRadius,
        border: kWhiteBorder,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: mediumPadding,
          right: mediumPadding,
          left: mediumPadding,
          bottom: smallPadding,
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
