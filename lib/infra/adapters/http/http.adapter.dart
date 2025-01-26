part 'http_response.dart';
part 'http_base_options.dart';

abstract class HttpAdapter {
  Future<HttpResponse> get({ required HttpBaseOptions options });
  Future<HttpResponse> post({ required HttpBaseOptions options });
  Future<HttpResponse> put({ required HttpBaseOptions options });
  Future<HttpResponse> delete({ required HttpBaseOptions options });
}