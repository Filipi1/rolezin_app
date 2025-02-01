import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rolezin_app/domain/entities/room.entity.dart';

class MockRoomEntity extends Mock implements RoomEntity {}

interface class MockRoomEntityParams {
  int? id;
  String? name;
  List<Map<String, dynamic>>? partners;
  List<Map<String, dynamic>>? items;
  double? establishmentBonusPercent;
  double? bruteBalance;
  double? totalBalance;
  List<Map<String, dynamic>>? memories;
  Map<String, dynamic>? geolocation;
  DateTime? createdAt;

  MockRoomEntityParams({
    int? id,
    String? name,
    List<Map<String, dynamic>>? partners,
    List<Map<String, dynamic>>? items,
    double? establishmentBonusPercent,
    double? bruteBalance,
    double? totalBalance,
    List<Map<String, dynamic>>? memories,
    Map<String, dynamic>? geolocation,
    DateTime? createdAt,
  });
}

class FakeRoomEntity {
  static RoomEntity create({MockRoomEntityParams? params}) {
    Faker faker = Faker();
    RoomEntity mockEntity = MockRoomEntity();
    double bruteBalance = params?.bruteBalance ?? faker.randomGenerator.decimal();
    when(() => mockEntity.toJson()).thenReturn({
      "id": params?.id ?? faker.randomGenerator.integer(9999),
      "name": params?.name ?? faker.randomGenerator.string(50),
      "geolocation": params?.geolocation,
      "partners": params?.partners ?? <Map<String, dynamic>>[],
      "items": params?.items ?? <Map<String, dynamic>>[],
      "establishmentBonusPercent": params?.establishmentBonusPercent ?? faker.randomGenerator.integer(10),
      "bruteBalance": params?.bruteBalance ?? bruteBalance,
      "totalBalance": params?.totalBalance ?? faker.randomGenerator.decimal(min: bruteBalance),
      "memories": params?.memories ?? <Map<String, dynamic>>[],
      "createdAt": params?.createdAt ?? faker.date.dateTime().toString()
    });
    return mockEntity;
  }
}
