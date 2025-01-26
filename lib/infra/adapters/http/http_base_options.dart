part of 'http.adapter.dart';

interface class HttpBaseOptions {
  final String path;
  final Map<String, dynamic>? params;
  final Map<String, dynamic>? body;

  HttpBaseOptions({required this.path, this.params, this.body});
}