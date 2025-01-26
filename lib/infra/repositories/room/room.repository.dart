import '../../../domain/entities/room.entity.dart';
import '../../adapters/http/http.adapter.dart';
import '../../entrypoints/repository.entrypoint.dart';

part 'room_repository_base.dart';

class RoomRepository extends Repository implements RoomRepositoryBase  {
  RoomRepository({required super.adapter});

  @override
  Future<RoomEntity?> fetchRoom({required int roomId}) async {
    HttpResponse response = await adapter.get(options: HttpBaseOptions(path: "/room/$roomId"));
    if (response.body == null) {
      return null;
    }
    return RoomEntity.fromJson(response.body!);
  }

  @override
  Future<List<RoomEntity>> fetchRooms({required String groupId}) async {
    HttpResponse response = await adapter.get(options: HttpBaseOptions(path: "/rooms"));
    if (response.body == null) {
      return [];
    }
    return (response.body as List).map((room) => RoomEntity.fromJson(room)).toList();
  }
}
