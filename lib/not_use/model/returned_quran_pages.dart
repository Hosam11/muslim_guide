import 'dart:convert';
import 'package:equatable/equatable.dart';

// To parse this JSON data, do
//
//     final quranPages = quranPagesFromJson(jsonString);

/// class responsible for getting original data from api
OriginalQuranPages quranPagesFromJson(String str) =>
    OriginalQuranPages.fromJson(jsonDecode(str));

String quranPagesToJson(OriginalQuranPages data) => jsonEncode(data.toJson());

class OriginalQuranPages extends Equatable {
  OriginalQuranPages({this.data});

  Data data;

  @override
  bool get stringify => false;

  factory OriginalQuranPages.fromJson(Map<String, dynamic> json) =>
      OriginalQuranPages(
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'data': data.toJson(),
      };

  @override
  List<Object> get props => [data];
}

class Data extends Equatable {
  Data({this.pageNumber, this.ayahs, this.surahs});

  int pageNumber;
  List<AyahModel> ayahs;
  Map<String, SurahValue> surahs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageNumber: json['number'],
        ayahs: List<AyahModel>.from(
            json['ayahs'].map((x) => AyahModel.fromJson(x))),
        surahs: Map.from(json['surahs']).map(
            (k, v) => MapEntry<String, SurahValue>(k, SurahValue.fromJson(v))),
      );

  @override
  bool get stringify => false;

  Map<String, dynamic> toJson() => {
        'number': pageNumber,
        'ayahs': List<dynamic>.from(ayahs.map((x) => x.toJson())),
        'surahs': Map.from(surahs)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };

  @override
  List<Object> get props => [
        pageNumber,
        ayahs,
        surahs,
      ];
}

class AyahModel extends Equatable {
  AyahModel({
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

  factory AyahModel.fromJson(Map<String, dynamic> json) => AyahModel(
        number: json['number'],
        text: json['text'],
        surah: AyahSurah.fromJson(json['surah']),
        numberInSurah: json['numberInSurah'],
        juz: json['juz'],
        manzil: json['manzil'],
        page: json['page'],
        ruku: json['ruku'],
        hizbQuarter: json['hizbQuarter'],
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'text': text,
        'surah': surah.toJson(),
        'numberInSurah': numberInSurah,
        'juz': juz,
        'manzil': manzil,
        'page': page,
        'ruku': ruku,
        'hizbQuarter': hizbQuarter,
      };

  @override
  bool get stringify => false;

  @override
  List<Object> get props => [
        number,
        text,
        surah,
        numberInSurah,
        juz,
        manzil,
        page,
        ruku,
        hizbQuarter
      ];
}

class AyahSurah extends Equatable {
  AyahSurah({this.number, this.name});

  int number;
  String name;

  @override
  bool get stringify => false;

  factory AyahSurah.fromJson(Map<String, dynamic> json) => AyahSurah(
        number: json['number'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {'number': number, 'name': name};

  @override
  List<Object> get props => [number, name];
}

class SurahValue extends Equatable {
  SurahValue({this.number, this.name});

  int number;
  String name;

  factory SurahValue.fromJson(Map<String, dynamic> json) => SurahValue(
        number: json['number'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'name': name,
      };

  @override
  List<Object> get props => [number, name];

  @override
  bool get stringify => false;
}
