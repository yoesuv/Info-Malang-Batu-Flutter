import 'package:rxdart/rxdart.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsBloc {

    final _locationPermission = PublishSubject<PermissionStatus>();

    Observable<PermissionStatus> get permissionStatus => _locationPermission.stream;

    checkLocationPermission() async {
        final permissionStatus = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
        _locationPermission.sink.add(permissionStatus);
    }

    dispose() {
        _locationPermission.close();
    }

}
