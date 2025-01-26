
import 'package:dio/dio.dart';

import '../http/http.adapter.dart';


class DioAdapter extends HttpAdapter {
  final Dio dio;

  DioAdapter({ required this.dio });

  Future<HttpResponse> __get({required HttpBaseOptions options}) async {
    Response response = await dio.get(
        options.path,
        data: options.body,
        queryParameters: options.params
    );
    return HttpResponse(
        status: response.statusCode ?? 0,
        requestHeaders: response.requestOptions.headers,
        requestBody: response.requestOptions.data,
        body: response.data
    );
  }

  @override
  Future<HttpResponse> request({required HttpBaseOptions options}) async {
    switch (options.method) {
      case HttpMethod.get:
        return __get(options: options);
      case HttpMethod.post:
        // TODO: Handle this case.
        throw UnimplementedError();
      case HttpMethod.put:
        // TODO: Handle this case.
        throw UnimplementedError();
      case HttpMethod.delete:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}