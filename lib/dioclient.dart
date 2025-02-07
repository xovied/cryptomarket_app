import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:path_provider/path_provider.dart';

import 'package:injectable/injectable.dart';
import 'dart:io';
import 'dataclasses.dart';

abstract class IWebClient {
  Future<List<Token>> getRating(int start, int limit);
  Future<List<Market>> getMarkets(int id);
}

@Injectable(as: IWebClient)
class DioClient implements IWebClient {
  Dio dio = Dio();
  DioClient() {
    dio.interceptors.add(DioInterceptor());
    late CacheStore cacheStore;

    getApplicationCacheDirectory().then((dir) {
      cacheStore = FileCacheStore(dir.path);

      var cacheOptions = CacheOptions(
        policy: CachePolicy.refreshForceCache,
        store: cacheStore,
        hitCacheOnErrorExcept: [],
        allowPostMethod: true,
      );

      dio.interceptors.add(
        DioCacheInterceptor(options: cacheOptions),
      );
    });
  }

  @override
  Future<List<Token>> getRating(int start, int limit) async {
    try {
      final response = await dio.postUri(
        Uri.https('api.coinlore.net', '/api/tickers/', {
          'start': start.toString(),
          'limit': limit.toString(),
        }),
      );
      final data = response.data['data'] as List<dynamic>;
      print("1!${response.statusCode}: ${response.extra}");
      return data.cast<Map<String, dynamic>>().map(Token.fromJson).toList();
    } catch (e) {
      throw (Exception());
    }
  }

  @override
  Future<List<Market>> getMarkets(int id) async {
    try {
      final response = await dio.postUri(
        Uri.https('api.coinlore.net', '/api/coin/markets/', {
          'id': id.toString(),
        }),
      );
      final data = response.data as List<dynamic>;

      print("2!${response.statusCode}: ${response.extra}");
      return data.cast<Map<String, dynamic>>().map(Market.fromJson).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}

class CacheStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationCacheDirectory();
    return directory.path;
  }

  Future<File> get _localLogFile async {
    final path = await _localPath;
    return File('$path/crypto_log.txt');
  }

  Future<String> getPath() {
    return _localPath;
  }

  Future<File> writeLog(String s) async {
    final file = await _localLogFile;

    return file.writeAsString(s, mode: FileMode.append);
  }
}

class DioInterceptor extends Interceptor {
  CacheStorage storage = CacheStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    storage.writeLog(
        '${DateTime.now()} REQUEST[${options.method}] => PATH: ${options.path}\n');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    storage.writeLog(
        '${DateTime.now()} RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\n');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    storage.writeLog(
        '${DateTime.now()} ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n');
    super.onError(err, handler);
  }
}
