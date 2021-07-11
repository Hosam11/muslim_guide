import 'package:flutter/foundation.dart';

class QuranProvider extends ChangeNotifier {
  bool _isBookmark = false;
  bool _isShowDetails = false;
  int _markedPage = -1;

  int get markedPageNum => _markedPage;

  bool get isShowDetails => _isShowDetails;

  bool get isBookmark => _isBookmark;

  set isShowDetails(bool value) {
    _isShowDetails = value;
    notifyListeners();
  }

  set isBookmark(bool value) {
    _isBookmark = value;
    notifyListeners();
  }

  set markedPageNum(int value) {
    _markedPage = value;
    notifyListeners();
  }
}
