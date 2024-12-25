import 'package:file_picker/file_picker.dart';
import 'package:music_player/src/utils/permission_handler.dart';

class HomeService {
  Future<bool> checkPermissions() async {
    return await requestStoragePermission();
  }

  selectFile() async {
    var isGranted = await checkPermissions();
    if (!isGranted) {
      print('Permission not granted');
      return;
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    print(result);
  }
}
