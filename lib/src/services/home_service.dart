import 'package:music_player/src/utils/permission_handler.dart';

class HomeService {
  static checkPermissions() async {
    await requestStoragePermission();
  }
}
