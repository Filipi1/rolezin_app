part of 'http.adapter.dart';

interface class HttpResponse {
  final int status;
  final Map<String, dynamic>? requestHeaders;
  final Map<String, dynamic>? requestBody;
  final Map<String, dynamic>? body;

  HttpResponse({required this.status, this.requestHeaders, this.requestBody, this.body});
}