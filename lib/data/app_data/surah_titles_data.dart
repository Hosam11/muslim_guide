import 'package:muslim_guide/data/models/surah/surah.dart';
import 'package:muslim_guide/data/repository/surah_titles_repo.dart';
import 'package:muslim_guide/widgets/surah/surah_name_title.dart';

late final List<Surah> _surahTitles;

/// use it to extract numberOfAyahs and rank from [Surah] to use it in
/// [SurahNameTitle]
List<Surah> get surahHeaders => _surahTitles;

Future<void> prepareSurahHeaders() async =>
    _surahTitles = await getSurahTitles();
