import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart' as colors;
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/constants/styles.dart' as styles;

class CategoryCardItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTapped;

  const CategoryCardItem({
    @required this.icon,
    @required this.title,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(dimens.smallPadding),
      child: Material(
        borderRadius: styles.kSmallBorderRadius,
        child: Ink(
          decoration: BoxDecoration(
            gradient: styles.createLinearGradient(
                colors.kPrimaryColor, colors.kSecPrimaryGradientColor),
            borderRadius: styles.kSmallBorderRadius,
            border: styles.kWhiteBorder,
          ),
          child: InkWell(
            onTap: () {
              if (onTapped != null) {
                onTapped();
              }
            },
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: dimens.mediumPadding,
                      bottom: dimens.smallPadding,
                    ),
                    child: Image.asset(icon, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      child: AutoSizeText(
                        title,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return car();
  }
}
