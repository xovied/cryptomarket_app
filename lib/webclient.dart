import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dataclasses.dart';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';

abstract class IWebClient {
  Future<List<Token>> getRating(int start, int limit);
  Future<List<Market>> getMarkets(int id);
}

@Injectable(as: IWebClient)
class WebClient implements IWebClient {
  final dio = Dio();
  late CacheStore cacheStore;
  WebClient() {
    dio.interceptors.add(DioInterceptor());

    getApplicationCacheDirectory().then((dir) {
      cacheStore = FileCacheStore(dir.path);

      var cacheOptions = CacheOptions(
        store: cacheStore,
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
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
      return data.cast<Map<String, dynamic>>().map(Token.fromJson).toList();
    } catch (e) {
      throw (Exception());
    }
  }

  @override
  Future<List<Market>> getMarkets(int id) async {
    try {
      final response = await dio
          .postUri(Uri.https('api.coinlore.net', '/api/coin/markets/', {
        'id': id.toString(),
      }));
      final data = response.data as List<dynamic>;
      print(response.extra);
      return data.cast<Map<String, dynamic>>().map(Market.fromJson).toList();
    } catch (e) {
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
