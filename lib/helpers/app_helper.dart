import 'dart:developer';

const isLog = true;

void mLog(String message) {
  if (isLog) {
    log('log= ' + message);
  } else {
    print('else');
  }
}

class AppHelper {
  AppHelper._privateConstructor();

  static final AppHelper instance = AppHelper._privateConstructor();
}
