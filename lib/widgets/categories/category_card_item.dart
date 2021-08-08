import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';

class CategoryCardItem extends StatelessWidget {
  final String icon;
  final String title;
  final void Function() onTapped;

  const CategoryCardItem({
    @required this.icon,
    @required this.title,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(smallDimens),
      child: Material(
        borderRadius: kSmallBorderRadius,
        child: Ink(
          decoration: BoxDecoration(
            gradient:
                createLinearGradient(kPrimaryColor, kSecPrimaryGradientColor),
            borderRadius: kSmallBorderRadius,
            border: kWhiteBorder,
          ),
          child: InkWell(
            onTap: onTapped,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: mediumDimens,
                      bottom: smallDimens,
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
  }
}
