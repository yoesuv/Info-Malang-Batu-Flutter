import 'package:permission_handler/permission_handler.dart';

class MapsBloc {

    Future<bool> checkLocationService() async{
        final ServiceStatus status = await PermissionHandler().checkServiceStatus(PermissionGroup.location);
        return status == ServiceStatus.enabled;
    }

    Future<bool> checkLocationPermission() async{
        final PermissionStatus status = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
        return status == PermissionStatus.granted;
    }

    Future<PermissionStatus> requestLocationPermission() async {
        final Map<PermissionGroup, PermissionStatus> permissionRequestResult = await PermissionHandler().requestPermissions(
            <PermissionGroup>[PermissionGroup.location]
        );
        return permissionRequestResult[PermissionGroup.location];
    }

}

final MapsBloc mapsBloc = MapsBloc();