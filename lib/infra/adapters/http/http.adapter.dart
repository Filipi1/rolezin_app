part 'http_response.dart';
part 'http_base_options.dart';
part 'http_methods.dart';

abstract class HttpAdapter {
  Future<HttpResponse> request({ required HttpBaseOptions options });
}