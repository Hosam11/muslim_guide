import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';

Future<dynamic> confirmationDialog(BuildContext context) {
  return showDialog<dynamic>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        confirmBookmark,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: kSecondaryColor,
      elevation: elevation,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              child: Text(yes, style: Theme.of(context).textTheme.headline6),
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: kNegativeButtonColor),
              onPressed: () => Navigator.pop(context, false),
              child: Text(no, style: Theme.of(context).textTheme.headline6),
            ),
          ),
        ],
      ),
    ),
  );
}
