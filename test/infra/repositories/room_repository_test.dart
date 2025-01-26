import 'package:flutter_test/flutter_test.dart';
import 'package:rolezin_app/domain/entities/room.entity.dart';
import 'package:rolezin_app/infra/repositories/room/room.repository.dart';
import '../../__mocks__/spy/http_adapter.spy.dart';


void main() {
  test("should request with correct value when call fetchRoom", () async {
    HttpAdapterSpy httpAdapter = HttpAdapterSpy();
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
    final repository = RoomRepository(adapter: httpAdapter);

    RoomEntity? sut = await repository.fetchRoom(roomId: 10);

    expect(sut, fakeEntity);
  });
}