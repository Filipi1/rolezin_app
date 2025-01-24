import 'room_memory.entity.dart';
import 'user.entity.dart';
import 'geolocation.entity.dart';
import 'item.entity.dart';

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
