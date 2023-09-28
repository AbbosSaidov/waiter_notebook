library api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../keys.dart';

class Api {
  static Future<HttpResult> post(
    url,
    data, {
    bool auhtorization = true,
    bool notIncludeContent = false,
    bool notdata = false,
    bool multicard = false,
  }) async {
    try {
      final dynamic headers;
      if (multicard) {
        String token = await auth();
        Keys.multicardtoken=token;
        headers = <String, String>{
          HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-Control': 'no-cache',
        };
      } else {
        headers = await _getReqHeader(auhtorization: auhtorization, notIncludeContent: notIncludeContent);
      }
      var res;

      res = await http.post(Uri.parse(url), body:notdata?null :data, headers: headers);
      return _result(res);
    } on TimeoutException catch (e) {
      return _result({});
    } on SocketException catch (e) {
      return _result({});
    } catch (e, s) {
      print("Error Api=$e==$s");
      return _result({});
    }
  }

  static Future<HttpResult> postDio(url, data, token) async {
    try {
      final dynamic headers = await _getReqHeader();
      var dio = Dio();
      var res = await dio
          .post(url, data: data, options: Options(headers: headers), cancelToken: token)
          .catchError((onError) {});
      return _resultDio(res);
    } catch (e) {
      return _resultDio({});
    }
  }

  static Future<HttpResult> getDio(url) async {
    try {
      final dynamic headers = await _getReqHeader();
      var dio = Dio();
      var res = await dio.post(url, options: Options(headers: headers)).catchError((onError) {});
      return _resultDio(res);
    } catch (e) {
      return _resultDio({});
    }
  }

  static Future<HttpResult> postDioMulti(url, file, modalType) async {
    try {
      Dio dio = Dio();
      String fileName = file.path.split('/').last;
      final dynamic headers = await _getReqHeader();
      FormData formData = FormData.fromMap(
          {"file": await MultipartFile.fromFile(file.path, filename: fileName), "model_type": modalType});

      var res = await dio.post(url, data: formData, options: Options(headers: headers));

      return _resultDio(res);
    } on DioError catch (e) {
      return _resultDio(e.response);
    } catch (e) {
      return _result(e);
    }
  }

  static Future<HttpResult> postDioAvatar(url, file) async {
    try {
      Dio dio = Dio();
      String fileName = file.path.split('/').last;
      final dynamic headers = await _getReqHeader();
      FormData formData = FormData.fromMap({
        "avatar": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      Response res = await dio.post(url, data: formData, options: Options(headers: headers)).catchError((onError) {});

      return _resultDio(res);
    } catch (e) {
      return _resultDio({});
    }
  }

  static Future<HttpResult> put(url, data) async {
    try {
      final dynamic headers = await _getReqHeader(notIncludeContent: true);

      var res = await http.put(Uri.parse(url), body: data, headers: headers);
      return _result(res);
    } catch (_) {
      return _result({});
    }
  }

  static Future<HttpResult> delete(url,{bool multicard=false}) async {
    try {
      final dynamic headers;
      if (multicard) {
        String token = await auth();
        Keys.multicardtoken=token;
        headers = <String, String>{
          HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-Control': 'no-cache',
        };
      } else {
        headers = await _getReqHeader();
      }
      var res = await http.delete(Uri.parse(url), headers: headers);
      return _result(res);
    } catch (_) {
      return _result({});
    }
  }

  static Future<HttpResult> get(url, {bool headerss = true,bool multicard = false,}) async {
    try {
      final dynamic headers;
      if (multicard) {
        headers = <String, String>{
          HttpHeaders.authorizationHeader: "Bearer " + Keys.multicardtoken.toString(),
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-Control': 'no-cache',
        };
      } else {
        headers = await _getReqHeader(auhtorization: headerss);
      }
      final response;

      response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      return _result(response);
    } on TimeoutException catch (e) {
      print("TimeoutException=$e");
      return _result({});
    } on SocketException catch (e, s) {
      print("SocketException=$e==$s");
      return _result({});
    } catch (e, s) {
      print("ErrorInAPi=$e==$s");
      return _result({});
    }
  }

  static Future<HttpResult> _result(response) async {
    dynamic result;
    int status = response.statusCode ?? 404;
    result = response.body;

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return HttpResult(true, result, status, result);
    } else if (response.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey("isAuth")) {
        prefs.setBool("isAuth", false);
      }
      return HttpResult(false, "", status, result);
    } else {
      print("SomeError=${response.body} ${response.statusCode} ");
      return HttpResult(false, "", status, result);
    }
  }

  static HttpResult _resultDio(response) {
    dynamic result;
    int status = response.statusCode ?? 404;
    result = json.encode(response.data);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return HttpResult(true, result, status, result);
    } else if (response.statusCode == 413) {
      return HttpResult(false, "", status, result);
    }
    {
      return HttpResult(false, "", status, result);
    }
  }

  static _getReqHeader({
    bool auhtorization = true,
    bool notIncludeContent = false,
  }) async {
    String? tokenString = "";
    if (Keys.tokenId?.isEmpty ?? false) {
      final prefs = await SharedPreferences.getInstance();
      tokenString = prefs.getString('tokenId') ?? "";
      Keys.tokenId = tokenString;
    } else {
      tokenString = Keys.tokenId;
    }
    String token = "Bearer ${Keys.tokenId}";

    final headers = {
      "accept": "*/*",
    };
    if (notIncludeContent) {
      headers["Content-type"] = "application/json";
    }
    if (auhtorization) {
      headers["Authorization"] = Keys.token??"";
      headers["UserCode"] = Keys.authCode??"";
    }
    return headers;
  }
}

class HttpResult {
  final bool isSuccess;
  final int status;
  final String result;
  final body;

  HttpResult(this.isSuccess, this.result, this.status, this.body);
}
