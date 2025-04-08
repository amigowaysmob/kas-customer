import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class FileDownloader {
  static String fileUrlPath = "";

  static void downloadCallback(String id, int status, int progress) {
    if (status == 3) {
      FlutterDownloader.open(taskId: id);
    }
  }

  void downloadFile(String url) async {
    try {
      bool storagePermissionGranted = false;

      final DeviceInfoPlugin info =
          DeviceInfoPlugin(); // import 'package:device_info_plus/device_info_plus.dart';
      final AndroidDeviceInfo androidInfo = await info.androidInfo;

      final int androidVersion = int.parse(androidInfo.version.release);

      if (Platform.isAndroid) {
        if (androidVersion >= 13) {
          // For Android 13 and above, use granular media permissions
          PermissionStatus photosStatus = await Permission.photos.request();
          //PermissionStatus storageStatus = await Permission.storage.request();

          if (photosStatus.isGranted) {
            storagePermissionGranted = true;
          } else if (photosStatus.isDenied) {
            // The user denied permission, show a request dialog
            storagePermissionGranted = false;
            await openAppSettings();
          } else {
            // Handle permission denied
            storagePermissionGranted = false;
          }
        } else {
          // For Android 12 and below, use the old storage permission
          storagePermissionGranted =
              await Permission.storage.request().isGranted;
        }
      } else {
        launchUrl(Uri.parse(url));
      }

      FlutterDownloader.registerCallback(downloadCallback);

      if (storagePermissionGranted) {
        final downloadsDirectory = await getDownloadsDirectory();

        final fileNameString = url.split(" / ").last;

        fileUrlPath = "${downloadsDirectory!.path}$fileNameString";

        final taskId = await FlutterDownloader.enqueue(
            url: url,
            savedDir: downloadsDirectory!.path,
            fileName: url.split("/").last, // Optional: define a filename
            showNotification:
                true, // Optional: show a notification with progress
            openFileFromNotification:
                true, // Optional: open the file when tapped
            saveInPublicStorage: false);
      } else {
        // Handle storage permission denied
        print('Storage Permission Denied');
        // You can show a dialog or toast to inform the user about the permission denial
      }
    } catch (e, stackTrace) {
      launchUrl(Uri.parse(url));
      // Handle general exceptions
      print('Error during download: $e');
      print('StackTrace: $stackTrace');
    }
  }
}
