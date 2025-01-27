import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rolezin_app/domain/entities/room.entity.dart';
import 'package:rolezin_app/infra/adapters/http/http.adapter.dart';
import 'package:rolezin_app/infra/repositories/room/room.repository.dart';


class MockRoomEntity extends Mock implements RoomEntity {}
class MockHttpAdapter extends Mock implements HttpAdapter {}
class MockHttpBaseOptions extends Mock implements HttpBaseOptions {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockHttpBaseOptions());
  });

  test("should request with correct value when call fetchRoom", () async {
    HttpAdapter httpAdapter = MockHttpAdapter();
    RoomEntity mockEntity = MockRoomEntity();
    when(() => mockEntity.toJson()).thenReturn({
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
    HttpResponse result = HttpResponse(status: 200, body: mockEntity.toJson());
    when(() => httpAdapter.request(options: any(named: "options"))).thenAnswer((options) async => Future.value(result));
    final repository = RoomRepository(adapter: httpAdapter);

    RoomEntity? sut = await repository.fetchRoom(roomId: 10);

    expect(sut, RoomEntity.fromJson(mockEntity.toJson()));
  });
}