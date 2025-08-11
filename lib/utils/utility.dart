import 'package:path/path.dart' as path;

class Utility {

  static bool isVideo(String? filePath) {
    if (filePath != null && filePath.isNotEmpty) {
      final extension = path.extension(filePath).toLowerCase();

      if (['.jpg', '.jpeg', '.png', '.gif','.webp','.heic'].contains(extension)) {
        return false;
      } else if (['.mp4', '.mov', '.avi', '.mkv','.webm', '.temp'].contains(extension)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static bool isNetworkImage(String? path) {
    return (path?.startsWith('http://') ?? false) || (path?.startsWith('https://') ?? false);
  }


// static Future<void> launchToUrl(String url) async {
  //   final canLaunch = await canLaunchUrl(Uri.parse(url));
  //   if (canLaunch) {
  //     await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  //   }
  // }
}
