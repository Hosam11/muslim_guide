import 'package:muslim_guide/helpers/arabic_numbers.dart';

class TestCode {
  String _testSett;

  set testSett(String value) {
    _testSett = value;
  }

  String testMissingReturnType() {
    String x = 'sd';
    final str = 'sad.json';

    print('sd ');
  }

  void f({bool valWithDefault = true, bool val}) {}

  @deprecated
  void testAll() {
    f(valWithDefault: true, val: true);
  }

  String testReturn() {
    var aaa = 'asd';
    return aaa;
  }
}

void main() {
  // \uFD3F${convertToArabic(ayah.ayahNumber)}\uFD3E
  final l = List.generate(286, (i) => i + 1);
  for (var i = 10; i < 30; i++) {
    print('i=$i  ${createDummyAyah('asd asd asd', i)}');
    var x = reversInt(i.toString());
    if (i > 9) {
      print(reversInt(i.toString()));
    }
    print('x= $x');
  }

  var xx = convertToArabic(50);

  var t = reversInt('xx = $xx');
  print('t= $t');
}

String reversInt(String s) => s.split('').reversed.join();

String createDummyAyah(String ayah, int n) {
  return '$ayah \uFD3F${convertToArabic(n)}\uFD3E';
}
