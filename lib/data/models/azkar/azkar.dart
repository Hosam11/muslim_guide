import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

// part 'azkar.g.dart';

// List<Azkar> azkarListFromJson(String str) => List<Azkar>.from(
//       jsonDecode(str).map((x) => Azkar.fromJson(x)),
//     );

@JsonSerializable()
class Azkar {
  Azkar({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.zekr,
  });

  final String category;
  final String count;
  final String description;
  final String reference;
  final String zekr;
  //
  // factory Azkar.fromJson(Map<String, dynamic> json) => _$AzkarFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$AzkarToJson(this);
}
