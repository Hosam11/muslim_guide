import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:muslim_guide/services/util/api_exception.dart';

Future<dynamic> getRequest({required String url}) async {
  try {
    var res = await Dio().get(url);
    return _networkStatus(res);
  } catch (e) {
    Fimber.i('HttpException => $e');
    return HttpException();
  }
}

dynamic _networkStatus(Response res) {
  // Fimber.i('res= $res');
  if (res.statusCode == 200) {
    return res;
  } else {
    return ResponseException();
  }
}
