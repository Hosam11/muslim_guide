import 'package:muslim_guide/data/models/azkar/azkar.dart';
import 'package:muslim_guide/data/repository/azkar_repo.dart';

final _azkarNight = <Azkar>[];
final _azkarMorning = <Azkar>[];

List<Azkar> get azkarNight => _azkarNight;

List<Azkar> get azkarMorning => _azkarMorning;

Future<void> prepareAzkarList() async {
  //  solved

  final night = await getAzkar(true);
  final morning = await getAzkar(false);
  _azkarNight.addAll(night);
  _azkarMorning.addAll(morning);
}
