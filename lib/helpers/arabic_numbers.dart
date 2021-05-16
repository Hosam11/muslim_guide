/// A Calculator.
class ArabicNumbers {
  String convert(dynamic number) {
    if (number is int) {
      final String replace1 = number.toString().replaceAll('0', '٠');
      final String replace2 = replace1.replaceAll('1', '١');
      final String replace3 = replace2.replaceAll('2', '٢');
      final String replace4 = replace3.replaceAll('3', '٣');
      final String replace5 = replace4.replaceAll('4', '٤');
      final String replace6 = replace5.replaceAll('5', '٥');
      final String replace7 = replace6.replaceAll('6', '٦');
      final String replace8 = replace7.replaceAll('7', '٧');
      final String replace9 = replace8.replaceAll('8', '٨');
      final String replace10 = replace9.replaceAll('9', '٩');
      return replace10;
    } else {
      final String replace1 = number.toString().replaceAll('0', '٠');
      final String replace2 = replace1.replaceAll('1', '١');
      final String replace3 = replace2.replaceAll('2', '٢');
      final String replace4 = replace3.replaceAll('3', '٣');
      final String replace5 = replace4.replaceAll('4', '٤');
      final String replace6 = replace5.replaceAll('5', '٥');
      final String replace7 = replace6.replaceAll('6', '٦');
      final String replace8 = replace7.replaceAll('7', '٧');
      final String replace9 = replace8.replaceAll('8', '٨');
      final String replace10 = replace9.replaceAll('9', '٩');
      return replace10;
    }
  }
}
