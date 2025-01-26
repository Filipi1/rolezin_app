part of 'room.repository.dart';

abstract class RoomRepositoryBase {
  Future<RoomEntity?> fetchRoom({required int roomId});
  Future<List<RoomEntity>> fetchRooms({required String groupId});
}