import 'dart:convert';

/// class responsible for display desired data
/// visit quran_pages.json to see json respond for that
List<QuranPage> quranPageFromJson(String str) =>
    List<QuranPage>.from(json.decode(str).map((x) => QuranPage.fromJson(x)));

String quranPageToJson(List<QuranPage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuranPage {
  QuranPage({
    this.pageNumber,
    this.ayahNumberMap,
  });

  @override
  String toString() {
    return 'pageNumber= $pageNumber\n'
        'ayahNumberMaps = $ayahNumberMap';
  }

  int pageNumber;
  Map<String, String> ayahNumberMap;

  factory QuranPage.fromJson(Map<String, dynamic> json) => QuranPage(
        pageNumber: json["pageNumber"],
        ayahNumberMap: Map.from(json["ayahNumberMap"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "ayahNumberMap": Map.from(ayahNumberMap)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
