import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rolezin_app/domain/entities/room.entity.dart';
import 'package:rolezin_app/infra/adapters/http/http.adapter.dart';
import 'package:rolezin_app/infra/repositories/room/room.repository.dart';


class MockRoomEntity extends Mock implements RoomEntity {}
class MockHttpAdapter extends Mock implements HttpAdapter {}
class MockHttpBaseOptions extends Mock implements HttpBaseOptions {}

void main() {
  Faker faker = Faker();

  setUpAll(() {
    registerFallbackValue(MockHttpBaseOptions());
  });

  RoomEntity mockRoomEntity() {
    RoomEntity mockEntity = MockRoomEntity();
    double bruteBalance = faker.randomGenerator.decimal();
    when(() => mockEntity.toJson()).thenReturn({
      "id": faker.randomGenerator.integer(9999),
      "name": faker.randomGenerator.string(50),
      "geolocation": null,
      "partners": <Map<String, dynamic>>[],
      "items": <Map<String, dynamic>>[],
      "establishmentBonusPercent": faker.randomGenerator.integer(10),
      "bruteBalance": bruteBalance,
      "totalBalance": faker.randomGenerator.decimal(min: bruteBalance),
      "memories": <Map<String, dynamic>>[],
      "createdAt": "2023-05-20T00:00:00"
    });
    return mockEntity;
  }

  test("should request with correct value when call fetchRoom", () async {
    HttpAdapter httpAdapter = MockHttpAdapter();
    RoomEntity roomEntity = mockRoomEntity();
    HttpResponse result = HttpResponse(status: 200, body: roomEntity.toJson());
    when(() => httpAdapter.request(options: any(named: "options"))).thenAnswer((options) async => Future.value(result));
    final repository = RoomRepository(adapter: httpAdapter);

    RoomEntity? sut = await repository.fetchRoom(roomId: 10);

    expect(sut, RoomEntity.fromJson(roomEntity.toJson()));
  });
}