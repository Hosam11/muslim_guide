import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart';

class GridItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTapped;

  GridItem({@required this.icon, @required this.title, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF5AADBF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3.0,
      child: InkWell(
        // I typed like this to make the ripple effect show on click on item
        onTap: () {
          if (onTapped != null) {
            onTapped();
          }
        },
        highlightColor: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: mediumPadding,
                  left: mediumPadding,
                  right: mediumPadding,
                ),
                child: Image.asset(
                  icon,
                  color: const Color(0xFFC5E1D1),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  title,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
