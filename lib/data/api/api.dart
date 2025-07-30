import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../../constants/api/api_const.dart';
import '../../core/expections/api_exception.dart';
import '../../core/expections/invalid_credentials_exceptions.dart';
import '../../core/expections/name_un_available_exception.dart';
import '../../core/expections/user_not_found_exception.dart';
import '../preference/local_preference.dart';
import '../preference/token_preference.dart';

@Injectable()
class Api {
  final _host = AppUrl.baseUrl;
  final _root = "/api/v1";
  final TokenPreference _token;
  final LocalPreference _localPreference;
  Api(this._token, this._localPreference);
  final _timeout = const Duration(seconds: 15);

  static final HttpWithMiddleware _httpClient = HttpWithMiddleware.build(
    middlewares: [HttpLogger(logLevel: LogLevel.BODY)],
  );

  Future<Response> get({
    required String path,
    Map<String, Object>? params,
  }) async {
    final uri = Uri.http(_host, "$_root/$path",
        params?.map((key, value) => MapEntry(key, value.toString())));
    final headers = await _headers;

    final result =
        await _httpClient.get(uri, headers: headers).timeout(_timeout);
    return propagateErrors(result);
  }

  Future<Response> post({
    required String path,
    Map<String, dynamic>? body,
    Map<String, Object>? params,
  }) async {
    final uri = Uri.http(_host, "$_root/$path", params);
    final headers = await _headers;
    print(headers);
    final result = await _httpClient
        .post(uri, headers: headers, body: jsonEncode(body))
        .timeout(_timeout);
    return propagateErrors(result);
  }

  Future<Response> put({
    required String path,
    Map<String, dynamic>? body,
    Map<String, Object>? params,
  }) async {
    final uri = Uri.http(_host, "$_root/$path", params);
    final headers = await _headers;
    final result = await _httpClient
        .put(uri,
            headers: headers, body: body != null ? jsonEncode(body) : null)
        .timeout(_timeout);
    return propagateErrors(result);
  }

  Future<Response> patch({
    required String path,
    Map<String, Object>? params,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.http(_host, "$_root/$path", params);
    final headers = await _headers;
    final result = await _httpClient
        .patch(uri,
            headers: headers, body: body != null ? jsonEncode(body) : null)
        .timeout(_timeout);
    return propagateErrors(result);
  }

  Future<Response> delete({
    required String path,
    Map<String, Object>? params,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.http(_host, "$_root/$path", params);
    final headers = await _headers;
    final result = await _httpClient
        .delete(uri,
            headers: headers, body: body != null ? jsonEncode(body) : null)
        .timeout(_timeout);
    return propagateErrors(result);
  }

  Future<Map<String, String>> get _headers async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    };
    final token = await _token.getToken() ?? await _token.getGuestToken();
    if (token != null) {
       headers["Authorization"] = "Bearer $token";
    }
    // final locale = await _localPreference.getLang();
    // if (locale != null) {
    //   headers["Accept-Language"] = locale;
    // }

    return headers;
  }

  Future<Response> propagateErrors(Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    }
    var decodedResponse = utf8.decode(response.bodyBytes);
    var decoded = jsonDecode(decodedResponse);
    switch (response.statusCode) {
      case 404:
        throw UserNotFoundException(decoded["message"]);
      case 401:
        await _token.clear();
        throw InvalidCredentialsException(decoded["message"]);
      case 403:
        await _token.clear();
        throw InvalidCredentialsException(decoded["message"]);
      case 402:
        throw NameUnavailableException(decoded["message"]);
      case 400:
        throw NameUnavailableException(decoded["message"]);
      case 500:
        throw NameUnavailableException(decoded["message"]);
      case 405:
        throw NameUnavailableException(decoded["message"]);
      default:
        throw ApiException("something_went_wrong");
    }
  }
}
