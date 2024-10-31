import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  Future<bool> checkPhoneStatePermission() async {
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      status = await Permission.phone.request();
    }
    return status.isGranted;
  }

  Future<bool> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
    }
    return status.isGranted;
  }

  Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
    return status.isGranted;
  }

  Future<bool> checkCalendarReadPermission() async {
    var status = await Permission.calendarFullAccess.status;
    if (!status.isGranted) {
      status = await Permission.calendarFullAccess.request();
    }
    return status.isGranted;
  }

  Future<bool> checkCalendarWritePermission() async {
    var status = await Permission.calendarWriteOnly.status;
    if (!status.isGranted) {
      status = await Permission.calendarWriteOnly.request();
    }
    return status.isGranted;
  }

  Future<bool> checkStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
