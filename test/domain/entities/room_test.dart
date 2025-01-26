import 'package:flutter_test/flutter_test.dart';
import 'package:rolezin_app/domain/entities/item.entity.dart';
import 'package:rolezin_app/domain/entities/room.entity.dart';
import 'package:rolezin_app/domain/entities/room_memory.entity.dart';
import 'package:rolezin_app/domain/entities/user.entity.dart';


void main() {
  test("should return correct values for fromJson", () {
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

    var sut = RoomEntity.fromJson(room);

    expect(sut.id, room["id"]);
    expect(sut.name, room["name"]);
    expect(sut.geolocation, room["geolocation"]);
    expect(sut.partners, (room["partners"] as List).map((partner)=> UserEntity()).toList());
    expect(sut.items, (room["items"] as List).map((partner)=> ItemEntity()).toList());
    expect(sut.establishmentBonusPercent, double.parse(room["establishmentBonusPercent"].toString()));
    expect(sut.bruteBalance, double.parse(room["bruteBalance"].toString()));
    expect(sut.totalBalance, double.parse(room["totalBalance"].toString()));
    expect(sut.memories, (room["memories"] as List).map((partner)=> RoomMemoryEntity()).toList());
    expect(sut.createdAt, DateTime.parse(room["createdAt"].toString()));
  });

  test("should return the correct value for getBonusIncreasedBalance", () {
    RoomEntity room = RoomEntity(
        id: 1,
        name: "Role na casa de praia!",
        geolocation: null,
        partners: [],
        items: [],
        establishmentBonusPercent: 10,
        bruteBalance: 100.55,
        totalBalance: 110.90,
        memories: [],
        createdAt: DateTime.now());

    double sut = room.getBonusIncreasedBalance();

    expect(sut, 10.35);
  });
}
