import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission() async {
  try {
    var permission = await Permission.audio.request();
    var mediaPermission = await Permission.mediaLibrary.request();

    if (permission.isGranted || mediaPermission.isGranted) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
