// https://api.aladhan.com/v1/calendar?method=5&month=8&year=2021&adjustment=8&latitude=31.2510664&longitude=29.9879269
// method=5&
// month=8&
// year=2021&
//latitude=31.2510664&
//longitude=29.9879269
import 'package:flutter/cupertino.dart';

const String _basePrayerTimesUrl = 'https://api.aladhan.com/v1/calendar';

String prayerTimesUrl({
  @required int month,
  @required int year,
  @required double lng,
  @required double lat,
  int method = 5,
}) =>
    '$_basePrayerTimesUrl?'
    'method=$method&'
    'month=$month&'
    'year=$year&'
    'latitude=$lat&'
    'longitude=$lng';
