import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_timings.dart';
import 'package:muslim_guide/helpers/prayer_helper.dart';
import 'package:muslim_guide/widgets/prayer_time_card.dart';

class PrayerTimesProvider extends ChangeNotifier {
  bool _isLoading = false;
  Position? _curLocation;
  PrayerTimings? _prayerTimings;
  late List<PrayerTimesCard> _prayersCardWidget;

  bool get isLoading => _isLoading;
  Position? get curLocation => _curLocation;
  PrayerTimings? get prayerTimings => _prayerTimings;
  List<PrayerTimesCard> get prayersCardWidget => _prayersCardWidget;

  set prayerTimings(PrayerTimings? times) {
    _prayerTimings = times;
    Fimber.i('prayerTimings= $times');
    _setupPrayerTimesCards();
    notifyListeners();
  }

  set curLocation(Position? value) {
    _curLocation = value;
    Fimber.i('_curLocation= $_curLocation');
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    Fimber.i('_isLoading= $_isLoading');
    notifyListeners();
  }

  void _setupPrayerTimesCards() {
    _prayersCardWidget = PrayerHelper.instance.prayerList(prayerTimings!);
    Fimber.i('_prayersCardWidgetLen= ${_prayersCardWidget.length}');
  }

  void resetData() {
    _isLoading = false;
    _prayerTimings = null;
    _prayersCardWidget.clear();
    notifyListeners();
  }
}
