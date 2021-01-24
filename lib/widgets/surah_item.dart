import 'package:flutter/material.dart';

import '../constants.dart';

const Color textColor = Color(0xFF1F6265);

class SurahItem extends StatelessWidget {
  final int surahNumber;
  final String name;
  final int numberOfAyahs;
  final String revelationType;

  SurahItem({
    this.surahNumber,
    this.name,
    this.numberOfAyahs,
    this.revelationType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // surah number
        Expanded(
          flex: 2,
          child: Container(
            // color: kPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  surahNumber > 9 ? surahNumber.toString() : '0$surahNumber',
                  style: TextStyle(
                    color: textColor,
                    fontSize: Theme.of(context).textTheme.headline6.fontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Surah Name
        Expanded(
          flex: 9,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              name,
              style: TextStyle(
                  color: textColor,
                  fontSize: Theme.of(context).textTheme.headline5.fontSize),
            ),
          ),
        ),
        // surah ayat & numberOfAyahs
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'آياتها',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  numberOfAyahs.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        // surah revelation Type
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            revelationType,
            style: TextStyle(
              fontSize: 18.0,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
