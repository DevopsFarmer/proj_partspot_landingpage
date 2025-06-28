// import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../utils/widgets/dialogs.dart';
//
// class MediaPermission {
//   static Future<bool> checkStoragePermission() async {
//     if (Platform.isAndroid) {
//       final androidInfo = await DeviceInfoPlugin().androidInfo;
//       if (androidInfo.version.sdkInt <= 32) {
//         final storagePermission = await Permission.storage.request();
//         if (storagePermission.isDenied) {
//           return (await Permission.storage.request()).isGranted;
//         } else if (storagePermission.isPermanentlyDenied) {
//           await showPermissionDeniedDialog();
//           return false;
//         } else {
//           return true;
//         }
//       } else {
//         return _photosAndGalleryRequestPermission();
//       }
//     } else if (Platform.isIOS) {
//       return _photosAndGalleryRequestPermission();
//     }
//     return false;
//   }
//
//   static Future<bool> _photosAndGalleryRequestPermission() async {
//     final photosPermission = await Permission.photos.request();
//     if (photosPermission.isDenied) {
//       return (await Permission.storage.request()).isGranted;
//     } else if (photosPermission.isPermanentlyDenied) {
//       await showPermissionDeniedDialog();
//       return false;
//     } else {
//       return true;
//     }
//   }
//
//   static Future<bool> checkCameraPermission() async {
//     final cameraPermission = await Permission.camera.request();
//     if (cameraPermission.isDenied) {
//       return (await Permission.camera.request()).isGranted;
//     } else if (cameraPermission.isPermanentlyDenied) {
//       await showPermissionDeniedDialog();
//       return false;
//     } else {
//       return true;
//     }
//   }
//
//   static Future<bool> checkLocationPermission() async {
//     final cameraPermission = await Permission.location.request();
//     if (cameraPermission.isDenied) {
//       return (await Permission.location.request()).isGranted;
//     } else if (cameraPermission.isPermanentlyDenied) {
//       await showPermissionDeniedDialog();
//       return false;
//     } else {
//       return true;
//     }
//   }
// }
