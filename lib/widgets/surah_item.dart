import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/routes.dart' as routes;
import 'package:muslim_guide/util.dart';

class SurahItem extends StatelessWidget {
  final int surahNumber;
  final String name;
  final int numberOfAyahs;
  final String revelationType;

  final ArabicNumbers _arabicNumbers = Util.arabicNumber;

  SurahItem({
    this.surahNumber,
    this.name,
    this.numberOfAyahs,
    this.revelationType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.popAndPushNamed(context, routes.surahScreen),
      child: Row(
        children: [
          // surah number
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(smallPadding),
              child: Center(
                child: Text(
                  _arabicNumbers.convert(surahNumber),
                  /*surahNumber > 9
                      ? _arabicNumbers.convert(surahNumber)
                      : '${_arabicNumbers.convert(0)}${_arabicNumbers.convert(surahNumber)}',*/
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: Theme.of(context).textTheme.headline6.fontSize,
                  ),
                ),
              ),
            ),
          ),
          // Surah Name
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(top: smallestPadding),
              child: Text(
                name,
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: Theme.of(context).textTheme.headline5.fontSize),
              ),
            ),
          ),
          // surah ayat & numberOfAyahs
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(smallPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'آياتها',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    numberOfAyahs.toString(),
                    style: const TextStyle(
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
              style: const TextStyle(
                fontSize: 18.0,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
