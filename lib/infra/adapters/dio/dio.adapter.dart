
import 'package:dio/dio.dart';

import '../http/http.adapter.dart';

class DioAdapter extends HttpAdapter {
  final Dio dio;

  DioAdapter({ required this.dio });

  @override
  Future<HttpResponse> delete({required HttpBaseOptions options}) async {
    Response response = await dio.delete(
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
  Future<HttpResponse> get({required HttpBaseOptions options}) async {
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
  Future<HttpResponse> post({required HttpBaseOptions options}) async {
    Response response = await dio.post(
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
  Future<HttpResponse> put({required HttpBaseOptions options}) async {
    Response response = await dio.post(
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
}