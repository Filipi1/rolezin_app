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

  factory RoomEntity.fromJson(Map<String, dynamic> json) {
    return RoomEntity(
        id: json["id"],
        name: json["name"],
        partners: (json["partners"] as List).map((partner)=> UserEntity()).toList(),
        items: (json["items"] as List).map((partner)=> ItemEntity()).toList(),
        establishmentBonusPercent: double.parse(json["establishmentBonusPercent"].toString()),
        bruteBalance: double.parse(json["bruteBalance"].toString()),
        totalBalance: double.parse(json["totalBalance"].toString()),
        memories: (json["memories"] as List).map((partner)=> RoomMemoryEntity()).toList(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
        geolocation: json["geolocation"]
    );
  }

  double getBonusIncreasedBalance() {
    return double.parse((totalBalance - bruteBalance).toStringAsFixed(2));
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "partners": partners.map((partner)=> partner.toJson()).toList(),
    "items": items.map((partner)=> partner.toJson()).toList(),
    "establishmentBonusPercent": establishmentBonusPercent,
    "bruteBalance": bruteBalance,
    "totalBalance": totalBalance,
    "memories": memories.map((partner) => partner.toJson()).toList(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "geolocation": geolocation?.toJson()
  };

  @override
  bool operator ==(Object other) {
    return other is RoomEntity && id == other.id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);
}
