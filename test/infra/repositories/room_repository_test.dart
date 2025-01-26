import 'package:flutter_test/flutter_test.dart';
import 'package:rolezin_app/domain/entities/room.entity.dart';
import 'package:rolezin_app/infra/adapters/http/http.adapter.dart';
import 'package:rolezin_app/infra/repositories/room/room.repository.dart';


class HttpAdapterSpy implements HttpAdapter {
  @override
  Future<HttpResponse> delete({required HttpBaseOptions options}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> get({required HttpBaseOptions options}) async {
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

  @override
  Future<HttpResponse> post({required HttpBaseOptions options}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> put({required HttpBaseOptions options}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}


void main() {
  test("should request with correct value when call fetchRoom", () async {
    RoomEntity fakeEntity = RoomEntity.fromJson({
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
    });

    final repository = RoomRepository(adapter: HttpAdapterSpy());

    RoomEntity? sut = await repository.fetchRoom(roomId: 10);

    expect(sut, fakeEntity);
  });
}