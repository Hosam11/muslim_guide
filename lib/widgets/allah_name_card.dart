import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/data/models/allah_names/allah_names.dart';

class AllahNameCard extends StatelessWidget {
  const AllahNameCard({
    Key? key,
    required this.allahName,
    required this.onNameTap,
  }) : super(key: key);

  final AllahName allahName;
  final void Function()? onNameTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(smallDimens),
      child: Material(
        borderRadius: kSmallBorderRadius,
        child: Ink(
          decoration: BoxDecoration(
            gradient: createLinearGradient(
              kPrimaryColor,
              kSecPrimaryGradientColor,
            ),
            borderRadius: kSmallBorderRadius,
            border: kWhiteBorder,
          ),
          child: InkWell(
            onTap: onNameTap,
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: AutoSizeText(
                      allahName.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
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
