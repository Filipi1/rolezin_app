part of 'http.adapter.dart';

interface class HttpBaseOptions {
  final String path;
  final HttpMethod method;
  final Map<String, dynamic>? params;
  final Map<String, dynamic>? body;

  HttpBaseOptions({required this.path, required this.method, this.params, this.body});
}