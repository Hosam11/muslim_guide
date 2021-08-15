import 'package:fimber/fimber.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences _prefs;

Future<void> init() async {
  _prefs = await SharedPreferences.getInstance();
  Fimber.i('_dbHash= ${_prefs.hashCode}');
}

Future<bool> setInt({required int value, required String key}) {
  Fimber.i('prefsHashed= ${_prefs.hashCode}');
  return _prefs.setInt(key, value);
}

int getInt({required String key, required int defaultValue}) {
  Fimber.i('prefsHashed= ${_prefs.hashCode}');
  return _prefs.getInt(key) ?? defaultValue;
}

Future<bool> setString({required String value, required String key}) {
  Fimber.i('prefsHashed= ${_prefs.hashCode}');
  return _prefs.setString(key, value);
}

String getString({required String key, required String defaultValue}) {
  Fimber.i('prefsHashed= ${_prefs.hashCode}');
  return _prefs.getString(key) ?? defaultValue;
}

Future<bool> clearPrefs() async => await _prefs.clear();
