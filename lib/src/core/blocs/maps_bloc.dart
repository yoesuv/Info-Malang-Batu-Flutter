import 'package:permission_handler/permission_handler.dart';

class MapsBloc {

    Future<bool> checkLocationService() async{
        final ServiceStatus status = await Permission.location.serviceStatus;
        return status == ServiceStatus.enabled;
    }

    Future<bool> checkLocationPermission() async{
        return await Permission.location.isGranted;
    }

    Future<PermissionStatus> requestLocationPermission() async {
       return await Permission.location.request();
    }

}

final MapsBloc mapsBloc = MapsBloc();