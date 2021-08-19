import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'allah_names.g.dart';

List<AllahName> allahNamesListFromJson(String str) =>
    List<AllahName>.from(jsonDecode(str).map((x) => AllahName.fromJson(x)));

@JsonSerializable()
class AllahName {
  AllahName({
    required this.name,
    required this.meaning,
  });

  final String name;
  final String meaning;

  Map<String, dynamic> toJson() => _$AllahNameToJson(this);

  factory AllahName.fromJson(Map<String, dynamic> json) =>
      _$AllahNameFromJson(json);
}
