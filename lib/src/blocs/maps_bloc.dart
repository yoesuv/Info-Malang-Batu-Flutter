import 'package:rxdart/rxdart.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsBloc {

    final _locationPermission = PublishSubject<PermissionStatus>();
    final _requestLocationResult = PublishSubject<PermissionStatus>();

    Observable<PermissionStatus> get permissionStatus => _locationPermission.stream;
    Observable<PermissionStatus> get requestLocationPermissionResult => _requestLocationResult.stream;

    checkLocationPermission() async {
        final permissionStatus = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
        _locationPermission.sink.add(permissionStatus);
    }

    Future<void> requestLocationPermission() async {
        final Map<PermissionGroup, PermissionStatus> permissionRequestResult = await PermissionHandler().requestPermissions([PermissionGroup.location]);
        final PermissionStatus permissionStatusResult = permissionRequestResult[PermissionGroup.location];
        _requestLocationResult.sink.add(permissionStatusResult);
    }

    dispose() {
        _locationPermission.close();
        _requestLocationResult.close();
    }

}
