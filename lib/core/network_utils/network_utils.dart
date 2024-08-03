//import 'package:design5/core/caching_utils/caching_utils.dart';
import 'package:dio/dio.dart';

import '../caching_utils/caching_utils.dart';

class NetworkUtils {
  static const String _baseURL = 'https://ink-notes-app.onrender.com/api/v1/';

  static late Dio _dio;

  static Future<void> init() async {
    _dio = Dio();
    _dio.options.baseUrl = _baseURL;
    _dio.options.validateStatus = (v) => v! < 500;
  }

  static Future<Response<dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    if (headers == null && CachingUtils.isLogged) {
      headers = {'Authorization': 'Bearer ${CachingUtils.token}'};
    }
    return _dio.post(
      path,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
  }

  static Future<Response<dynamic>> patch(
      String path, {
        Object? data,
        Map<String, dynamic>? headers,
      }) async {
    if (headers == null && CachingUtils.isLogged) {
      headers = {"Authorization": "Bearer ${CachingUtils.token}"};
    }
    return _dio.patch(
      path,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
  }

  static Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    if (headers == null && CachingUtils.isLogged) {
      headers = {'Authorization': 'Bearer ${CachingUtils.token}'};
    }
    return _dio.get(
      path,
      options: Options(
        headers: headers,
      ),
    );
  }

  static Future<Response<dynamic>> delete(
      String path, {
        Map<String, dynamic>? headers,
      }) async {
    if (headers == null && CachingUtils.isLogged) {
      headers = {"Authorization": "Bearer ${CachingUtils.token}"};
    }
    return _dio.delete(
      path,
      options: Options(
        headers: headers,
      ),
    );
  }
}
