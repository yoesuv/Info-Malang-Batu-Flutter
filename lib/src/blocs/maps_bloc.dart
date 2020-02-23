import 'package:rxdart/rxdart.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsBloc {

    final PublishSubject<PermissionStatus> _locationPermission = PublishSubject<PermissionStatus>();
    final PublishSubject<PermissionStatus> _requestLocationResult = PublishSubject<PermissionStatus>();

    Stream<PermissionStatus> get permissionStatus => _locationPermission.stream;
    Stream<PermissionStatus> get requestLocationPermissionResult => _requestLocationResult.stream;

    Future<bool> checkLocationService() async{
        final ServiceStatus status = await PermissionHandler().checkServiceStatus(PermissionGroup.location);
        return status == ServiceStatus.enabled;
    }

    void checkLocationPermission(){
        final Future<PermissionStatus> permissionStatus = PermissionHandler().checkPermissionStatus(PermissionGroup.location);
        if (!_locationPermission.isClosed) {
            permissionStatus.then((PermissionStatus result){
                _locationPermission.sink.add(result);
            });
        }
    }

    Future<void> requestLocationPermission() async {
        final Map<PermissionGroup, PermissionStatus> permissionRequestResult = await PermissionHandler().requestPermissions(
            <PermissionGroup>[PermissionGroup.location]
        );
        final PermissionStatus permissionStatusResult = permissionRequestResult[PermissionGroup.location];
        if (!_requestLocationResult.isClosed) {
            _requestLocationResult.sink.add(permissionStatusResult);
        }
    }

    void dispose() {
        if (!_locationPermission.isClosed) {
            _locationPermission.close();
        }
        if (!_requestLocationResult.isClosed) {
            _requestLocationResult.close();
        }
    }

}

final MapsBloc mapsBloc = MapsBloc();