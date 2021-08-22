import 'package:muslim_guide/data/models/azkar/azkar.dart';
import 'package:muslim_guide/data/repository/azkar_repo.dart';

late List<Azkar> _azkarNight;
late List<Azkar> _azkarMorning;

List<Azkar> get azkarNight => _azkarNight;

List<Azkar> get azkarMorning => _azkarMorning;

Future<void> prepareAzkarList() async {
  _azkarNight = await getAzkar(true);
  _azkarMorning = await getAzkar(false);
}
