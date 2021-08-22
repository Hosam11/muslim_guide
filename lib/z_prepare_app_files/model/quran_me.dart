// To parse this JSON data, do
//
//     final metaList = metaListFromJson(jsonString);

import 'dart:convert';

MetaModel metaListFromJson(String str) => MetaModel.fromJson(json.decode(str));

String metaListToJson(MetaModel data) => json.encode(data.toJson());

class MetaModel {
  MetaModel({
    this.code,
    this.status,
    this.data,
  });

  final int? code;
  final String? status;
  final MetaData? data;

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        code: json['code'],
        status: json['status'],
        data: MetaData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data!.toJson(),
      };
}

class MetaData {
  MetaData({
    this.ayahs,
    this.surahs,
    this.sajdas,
    this.rukus,
    this.pages,
    this.manzils,
    this.hizbQuarters,
    this.juzs,
  });

  final Ayahs? ayahs;
  final Surahs? surahs;
  final Sajdas? sajdas;
  final HizbQuarters? rukus;
  final HizbQuarters? pages;
  final HizbQuarters? manzils;
  final HizbQuarters? hizbQuarters;
  final HizbQuarters? juzs;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        ayahs: Ayahs.fromJson(json['ayahs']),
        surahs: Surahs.fromJson(json['surahs']),
        sajdas: Sajdas.fromJson(json['sajdas']),
        rukus: HizbQuarters.fromJson(json['rukus']),
        pages: HizbQuarters.fromJson(json['pages']),
        manzils: HizbQuarters.fromJson(json['manzils']),
        hizbQuarters: HizbQuarters.fromJson(json['hizbQuarters']),
        juzs: HizbQuarters.fromJson(json['juzs']),
      );

  Map<String, dynamic> toJson() => {
        'ayahs': ayahs!.toJson(),
        'surahs': surahs!.toJson(),
        'sajdas': sajdas!.toJson(),
        'rukus': rukus!.toJson(),
        'pages': pages!.toJson(),
        'manzils': manzils!.toJson(),
        'hizbQuarters': hizbQuarters!.toJson(),
        'juzs': juzs!.toJson(),
      };
}

class Ayahs {
  Ayahs({
    this.count,
  });

  final int? count;

  factory Ayahs.fromJson(Map<String, dynamic> json) => Ayahs(
        count: json['count'],
      );

  Map<String, dynamic> toJson() => {
        'count': count,
      };
}

class HizbQuarters {
  HizbQuarters({
    this.count,
    this.references,
  });

  final int? count;
  final List<HizbQuartersReference>? references;

  factory HizbQuarters.fromJson(Map<String, dynamic> json) => HizbQuarters(
        count: json['count'],
        references: List<HizbQuartersReference>.from(
            json['references'].map((x) => HizbQuartersReference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'references': List<dynamic>.from(references!.map((x) => x.toJson())),
      };
}

class HizbQuartersReference {
  HizbQuartersReference({
    this.surah,
    this.ayah,
  });

  final int? surah;
  final int? ayah;

  factory HizbQuartersReference.fromJson(Map<String, dynamic> json) =>
      HizbQuartersReference(
        surah: json['surah'],
        ayah: json['ayah'],
      );

  Map<String, dynamic> toJson() => {
        'surah': surah,
        'ayah': ayah,
      };
}

class Sajdas {
  Sajdas({
    this.count,
    this.references,
  });

  final int? count;
  final List<SajdasReference>? references;

  factory Sajdas.fromJson(Map<String, dynamic> json) => Sajdas(
        count: json['count'],
        references: List<SajdasReference>.from(
            json['references'].map((x) => SajdasReference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'references': List<dynamic>.from(references!.map((x) => x.toJson())),
      };
}

class SajdasReference {
  SajdasReference({
    this.surah,
    this.ayah,
    this.recommended,
    this.obligatory,
  });

  final int? surah;
  final int? ayah;
  final bool? recommended;
  final bool? obligatory;

  factory SajdasReference.fromJson(Map<String, dynamic> json) =>
      SajdasReference(
        surah: json['surah'],
        ayah: json['ayah'],
        recommended: json['recommended'],
        obligatory: json['obligatory'],
      );

  Map<String, dynamic> toJson() => {
        'surah': surah,
        'ayah': ayah,
        'recommended': recommended,
        'obligatory': obligatory,
      };
}

class Surahs {
  Surahs({
    this.count,
    this.references,
  });

  final int? count;
  final List<SurahsReference>? references;

  factory Surahs.fromJson(Map<String, dynamic> json) => Surahs(
        count: json['count'],
        references: List<SurahsReference>.from(
            json['references'].map((x) => SurahsReference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'references': List<dynamic>.from(references!.map((x) => x.toJson())),
      };
}

class SurahsReference {
  SurahsReference({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final int? numberOfAyahs;
  final RevelationType? revelationType;

  factory SurahsReference.fromJson(Map<String, dynamic> json) =>
      SurahsReference(
        number: json['number'],
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        numberOfAyahs: json['numberOfAyahs'],
        revelationType: revelationTypeValues.map[json['revelationType']],
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'name': name,
        'englishName': englishName,
        'englishNameTranslation': englishNameTranslation,
        'numberOfAyahs': numberOfAyahs,
        'revelationType': revelationTypeValues.reverse![revelationType!],
      };
}

// meccan, median
enum RevelationType { meccan, median }

final revelationTypeValues = EnumValues(
    {'Meccan': RevelationType.meccan, 'Medinan': RevelationType.median});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
