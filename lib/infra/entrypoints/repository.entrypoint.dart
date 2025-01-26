import '../adapters/http/http.adapter.dart';

abstract class Repository {
  final HttpAdapter adapter;

  Repository({ required this.adapter });
}