import 'dart:convert';

// To parse this JSON data, do
//
//     final quranPages = quranPagesFromJson(jsonString);

/// class responsible for getting original data from api
OriginalQuranPages quranPagesFromJson(String str) =>
    OriginalQuranPages.fromJson(jsonDecode(str));

String quranPagesToJson(OriginalQuranPages data) => jsonEncode(data.toJson());

class OriginalQuranPages {
  OriginalQuranPages({this.data});

  Data data;

  factory OriginalQuranPages.fromJson(Map<String, dynamic> json) =>
      OriginalQuranPages(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({this.pageNumber, this.ayahs, this.surahs});

  int pageNumber;
  List<Ayah> ayahs;
  Map<String, SurahValue> surahs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageNumber: json["number"],
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
        surahs: Map.from(json["surahs"]).map(
            (k, v) => MapEntry<String, SurahValue>(k, SurahValue.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "number": pageNumber,
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
        "surahs": Map.from(surahs)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Ayah {
  Ayah({
    this.number,
    this.text,
    this.surah,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
  });

  int number;
  String text;
  AyahSurah surah;
  int numberInSurah;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        text: json["text"],
        surah: AyahSurah.fromJson(json["surah"]),
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
        'surah': surah.toJson(),
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
      };
}

class AyahSurah {
  AyahSurah({this.number, this.name});

  int number;
  String name;

  factory AyahSurah.fromJson(Map<String, dynamic> json) => AyahSurah(
        number: json['number'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {"number": number, "name": name};
}

class SurahValue {
  SurahValue({this.number});

  int number;

  factory SurahValue.fromJson(Map<String, dynamic> json) => SurahValue(
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {"number": number};
}
