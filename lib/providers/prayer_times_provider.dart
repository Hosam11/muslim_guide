import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guide/data/floor/entities/prayer_entity.dart';
import 'package:muslim_guide/helpers/prayer_helper.dart';
import 'package:muslim_guide/widgets/prayer_time_card.dart';

class PrayerTimesProvider extends ChangeNotifier {
  bool _isLoading = false;
  Position? _curLocation;
  PrayerEntity? _prayerEntity;
  late List<PrayerTimesCard> _prayersCardWidget;

  bool get isLoading => _isLoading;
  Position? get curLocation => _curLocation;
  PrayerEntity? get prayerEntity => _prayerEntity;
  List<PrayerTimesCard> get prayersCardWidget => _prayersCardWidget;

  set prayerEntity(PrayerEntity? prayerEntities) {
    _prayerEntity = prayerEntities;
    Fimber.i('prayerEntities= $prayerEntities');
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
    _prayersCardWidget = PrayerHelper.instance.prayerList(prayerEntity);
    Fimber.i('_prayersCardWidgetLen= ${_prayersCardWidget.length}');
  }

  void resetData() {
    // _isLoading = false;
    _prayerEntity = null;
    _curLocation = null;

    _prayersCardWidget.clear();
    notifyListeners();
  }
}
