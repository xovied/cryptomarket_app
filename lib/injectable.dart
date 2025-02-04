/*import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';
import 'package:dio/dio.dart';
import 'dart:io';

final getIt = GetIt.instance;

class DioInterceptor extends Interceptor {
  File file = File(".cashe");

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    file.writeAsString(
      '${DateTime.now()} REQUEST[${options.method}] => PATH: ${options.path}\n',
      mode: FileMode.append,
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    file.writeAsString(
      '${DateTime.now()} RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\n',
      mode: FileMode.append,
    );
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    file.writeAsString(
      '${DateTime.now()} ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n',
      mode: FileMode.append,
    );
    super.onError(err, handler);
  }
}

@injectable
abstract interface class IWebClient {
  Future<List<dynamic>> getRating(int start, int limit);
  Future<List<dynamic>> getMarkets(int id);
}

class WebClient implements IWebClient {
  final dio = Dio();
  WebClient() {
    dio.interceptors.add(DioInterceptor());
  }

  @override
  Future<List<dynamic>> getRating(int start, int limit) async {
    try {
      final response = await dio.postUri(
        Uri.https('api.coinlore.net', '/api/tickers/', {
          'start': start.toString(),
          'limit': limit.toString(),
        }),
      );
      final data = response.data['data'] as List<dynamic>;
      return data;
    } finally {
      dio.close();
    }
  }

  @override
  Future<List<dynamic>> getMarkets(int id) async {
    try {
      final response = await dio
          .postUri(Uri.https('api.coinlore.net', '/api/coin/markets/', {
        'id': id.toString(),
      }));
      final data = response.data as List<dynamic>;
      return data;
    } finally {
      dio.close();
    }
  }
}

@injectableInit
void configureDependencies() => getIt.init();
*/
