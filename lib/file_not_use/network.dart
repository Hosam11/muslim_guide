import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:muslim_guide/data/models/quran_page.dart';

import 'returned_quran_pages.dart';

class Network {}

// take page number and return data from api
Future<Data> getData(int page) async {
  final dataResponse =
      await http.get('http://api.alquran.cloud/v1/page/$page/ar.asad');

  final decodeData =
      convert.jsonDecode(dataResponse.body) as Map<String, dynamic>;
  final pages = OriginalQuranPages.fromJson(decodeData);

  return pages.data;
}

Future<void> storeData() async {
  final List<QuranPage> quranPages = <QuranPage>[];

  for (int i = 1; i <= 3; i++) {
    final data = await getData(i);
    // print('$i');
    // create pageNumber and ayahs map to create object from result
    final int pageNumber = data.pageNumber;
    final Map<String, String> ayahs = <String, String>{};

    for (final Ayah a in data.ayahs) {
      ayahs[a.numberInSurah.toString()] = a.text;
    }

    QuranPage q = QuranPage(
      pageNumber: pageNumber,
      ayahNumberMap: ayahs,
    );

    quranPages.add(q);
  }
  print('first element= ## ${quranPages[0]} ##');

  var x = convert.jsonEncode(quranPages);
  print('-----------------------------------------------------------------');
  print(x);
}

void main() {
  storeData();
}
