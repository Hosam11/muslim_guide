import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';

Future<dynamic> takeActionDialog({
  @required BuildContext context,
  @required String msg,
  String positiveBtnStr = yes,
  String negativeBtnStr = no,
}) {
  return showDialog<dynamic>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        msg,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      backgroundColor: kSecondaryColor,
      elevation: elevation,
      // content: ,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            left: mediumDimens,
            right: mediumDimens,
            bottom: smallDimens,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                  child: Text(positiveBtnStr,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: kNegativeButtonColor),
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(negativeBtnStr,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Future<dynamic> testDialog(BuildContext context) {
  return showDialog<dynamic>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'test msg',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: kSecondaryColor,
      elevation: elevation,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(primary: kPrimaryColor),
          child: Text(yes, style: Theme.of(context).textTheme.subtitle1),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: kNegativeButtonColor),
          onPressed: () => Navigator.pop(context, false),
          child: Text(no, style: Theme.of(context).textTheme.headline6),
        ),
      ],
    ),
  );
}

Future<dynamic> showInfoDialog(BuildContext context, String msg) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: kSecondaryColor,
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      ),
    ),
  );
}
