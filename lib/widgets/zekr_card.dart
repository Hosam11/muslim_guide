import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/models/azkar/azkar.dart';
import 'package:muslim_guide/helpers/app/app_dialogs.dart';

class ZekrCard extends StatelessWidget {
  const ZekrCard({Key? key, required this.azkar}) : super(key: key);

  final Azkar azkar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(smallDimens),
      child: Material(
        borderRadius: BorderRadius.circular(mediumDimens),
        child: Ink(
          decoration: BoxDecoration(
            /*   gradient:
                createLinearGradient(kPrimaryColor, kSecPrimaryGradientColor),*/
            borderRadius: kSmallBorderRadius,
            border: kWhiteBorder,
            color: kPrimaryColor,
          ),
          // color: kPrimaryColor,
          child: InkWell(
            onTap: () => azkar.description != null
                ? showInfoDialog(context, azkar.description)
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: mediumDimens, vertical: smallDimens),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: smallDimens),
                    child: Text(
                      // '\u202E${azkar.zekr}',
                      '\u202E${azkar.zekr}',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: smallDimens),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          azkar.reference ?? '',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '$count: ${azkar.count}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
