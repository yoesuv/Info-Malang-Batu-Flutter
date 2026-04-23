import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class LocationService {
  bool get isIOS => Platform.isIOS;

  Future<ServiceStatus> get locationServiceStatus =>
      Permission.location.serviceStatus;

  Future<PermissionStatus> requestLocationPermission() =>
      Permission.location.request();
}
