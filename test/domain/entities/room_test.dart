import 'package:flutter_test/flutter_test.dart';
import 'package:rolezin_app/domain/entities/room.entity.dart';


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
