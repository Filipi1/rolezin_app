import 'package:flutter_test/flutter_test.dart';

class UserEntity {}

class ItemEntity {}

class RoomMemoryEntity {}

class GeolocationEntity {
  final num latitude;
  final num longitude;

  GeolocationEntity(this.latitude, this.longitude);
}

class RoomEntity {
  final int id;
  final String name;
  final GeolocationEntity? geolocation;
  final List<UserEntity> partners;
  final List<ItemEntity> items;
  final double establishmentBonusPercent;
  final double bruteBalance;
  final double totalBalance;
  final List<RoomMemoryEntity> memories;
  final DateTime createdAt;
  final DateTime? updatedAt;

  RoomEntity({
    required this.id,
    required this.name,
    required this.partners,
    required this.items,
    required this.establishmentBonusPercent,
    required this.bruteBalance,
    required this.totalBalance,
    required this.memories,
    required this.createdAt,
    this.updatedAt,
    this.geolocation,
  });

  double getBonusIncreasedBalance() {
    return double.parse((totalBalance - bruteBalance).toStringAsFixed(2));
  }
}

void main() {
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
