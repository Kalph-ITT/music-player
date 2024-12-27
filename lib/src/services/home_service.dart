import 'package:music_player/src/utils/permission_handler.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeService {
  Future<bool> checkPermissions() async {
    return await requestStoragePermission();
  }

  Future<List<SongModel>> scanFiles() async {
    final OnAudioQuery audioQuery = OnAudioQuery();
    var isGranted = await checkPermissions();
    if (!isGranted) {
      print('Permission not granted');
      return [];
    }

    List<SongModel> audios = await audioQuery.querySongs(
      ignoreCase: true,
    );

    print(audios);

    return audios;
  }
}
