import 'package:muslim_guide/data/models/allah_names/allah_names.dart';
import 'package:muslim_guide/data/repository/allah_names_repo.dart';

late List<AllahName> _allahNames;

List<AllahName> get allahNames => _allahNames;

Future<void> prepareAllahNamesList() async =>
    _allahNames = await getAllahNames();
