import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/fonts.dart';

/*const TextStyle kScreenTitleStyle = TextStyle(
  color: kTextColor,
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
);*/

final BorderRadius kSmallBorderRadius = BorderRadius.circular(smallPadding);

final kWhiteBorder = Border.all(color: kTextColor);

final BoxDecoration kPrimaryBackgroundBoxDecoration = BoxDecoration(
  gradient: createLinearGradient(
    kPrimaryColor,
    kSecPrimaryGradientColor,
  ),
);

final BoxDecoration kSecondaryBackgroundBoxDecoration = BoxDecoration(
  gradient: createLinearGradient(
    kSecondaryColor,
    kSecSecondaryGradientColor,
  ),
);

final BoxDecoration kSurahTitleBackgroundBoxDecoration = BoxDecoration(
  gradient: createLinearGradient(
    kFirSurahTitleGradientColor,
    kSecSurahTitleGradientColor,
  ),
);

BoxDecoration createGradientBackground(Color firColor, Color secColor) =>
    BoxDecoration(
      gradient: createLinearGradient(firColor, secColor),
    );

BoxDecoration pagePopupDecoration = BoxDecoration(
  color: Colors.black.withOpacity(.8),
);

TextStyle ayahTextStyle(context) =>
    Theme.of(context).textTheme.headline5.copyWith(
          fontFamily: meQuranFont,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5,
        );

BoxShadow shadowFromColor(Color color) => BoxShadow(
      color: color.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    );

LinearGradient createLinearGradient(Color firColor, Color secColor) =>
    LinearGradient(
      colors: [firColor, secColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // stops: const [0.0, 0.1],
      // tileMode: TileMode.mirror,);
    );
