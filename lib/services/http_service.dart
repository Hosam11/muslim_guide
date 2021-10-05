import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:muslim_guide/services/util/api_exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<dynamic> getRequest({required String url}) async {
  try {
    final dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
    // fixme: remove it at production
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    var res = await dio.get(url);

    return _networkStatus(res);
  } catch (e) {
    return HttpException();
  }
}

dynamic _networkStatus(Response res) {
  if (res.statusCode == 200) {
    return res;
  } else {
    return ResponseException();
  }
}
