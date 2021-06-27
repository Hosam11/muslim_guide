import 'package:flutter/cupertino.dart';

class QuranProvider extends ChangeNotifier {
  int _quranPageNumber = 0;

  int get quranPageNumber => _quranPageNumber;

  set quranPageNumber(int value) {
    _quranPageNumber = value;
    notifyListeners();
  }
}
