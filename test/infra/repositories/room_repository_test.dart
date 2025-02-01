import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rolezin_app/domain/entities/room.entity.dart';
import 'package:rolezin_app/infra/adapters/http/http.adapter.dart';
import 'package:rolezin_app/infra/repositories/room/room.repository.dart';

import '../../__mocks__/fakers/room_entity.fake.dart';


class MockHttpAdapter extends Mock implements HttpAdapter {}
class MockHttpBaseOptions extends Mock implements HttpBaseOptions {}

void main() {
  Faker faker = Faker();

  setUpAll(() {
    registerFallbackValue(MockHttpBaseOptions());
  });

  test("should request with correct value when call fetchRoom", () async {
    HttpAdapter httpAdapter = MockHttpAdapter();
    RoomEntity roomEntity = FakeRoomEntity.create();
    HttpResponse result = HttpResponse(status: 200, body: roomEntity.toJson());
    when(() => httpAdapter.request(options: any(named: "options"))).thenAnswer((options) async => Future.value(result));
    final repository = RoomRepository(adapter: httpAdapter);

    RoomEntity? sut = await repository.fetchRoom(roomId: 10);

    expect(sut, RoomEntity.fromJson(roomEntity.toJson()));
  });
}