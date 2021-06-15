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
