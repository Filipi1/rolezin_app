import 'package:rolezin_app/infra/adapters/http/http.adapter.dart';

class HttpAdapterSpy implements HttpAdapter {
  @override
  Future<HttpResponse> request({required HttpBaseOptions options}) async {
    const room = {
      "id": 1,
      "name": "Role na casa de praia!",
      "geolocation": null,
      "partners": <Map<String, dynamic>>[],
      "items": <Map<String, dynamic>>[],
      "establishmentBonusPercent": 10,
      "bruteBalance": 100.55,
      "totalBalance": 110.90,
      "memories": <Map<String, dynamic>>[],
      "createdAt": "2023-05-20T00:00:00"
    };
    return HttpResponse(
        status: 200,
        requestHeaders: {},
        body: room
    );
  }
}
