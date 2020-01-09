import 'package:rxdart/rxdart.dart';
import 'package:permission_handler/permission_handler.dart';
import '../repositories/maps_repository.dart';
import '../models/maps/list_item_maps_pin_model.dart';
import '../models/service_model.dart';
import '../services/app_exceptions.dart';

class MapsBloc {

    final _mapsRepository = MapsRepository();
    final _locationPermission = PublishSubject<PermissionStatus>();
    final _requestLocationResult = PublishSubject<PermissionStatus>();
    final _listItemMapsPin = PublishSubject<ServiceModel<ListItemMapsPinModel>>();

    Stream<PermissionStatus> get permissionStatus => _locationPermission.stream;
    Stream<PermissionStatus> get requestLocationPermissionResult => _requestLocationResult.stream;
    Stream<ServiceModel<ListItemMapsPinModel>> get listItemMapsPins => _listItemMapsPin.stream;

    checkLocationPermission() async {
        final permissionStatus = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
        _locationPermission.sink.add(permissionStatus);
    }

    Future<void> requestLocationPermission() async {
        final Map<PermissionGroup, PermissionStatus> permissionRequestResult = await PermissionHandler().requestPermissions([PermissionGroup.location]);
        final PermissionStatus permissionStatusResult = permissionRequestResult[PermissionGroup.location];
        _requestLocationResult.sink.add(permissionStatusResult);
    }

    getListMapsPin() async {
        try {
            final listMapsPin = await _mapsRepository.getMapsPin();
            _listItemMapsPin.sink.add(ServiceModel.completed(listMapsPin));
        } catch (e) {
            if (e is AppException) {
                _listItemMapsPin.sink.add(ServiceModel.dioError(e));
            } else {
                _listItemMapsPin.sink.add(ServiceModel.error('Unknown Exception'));
            }
        }

    }

    dispose() {
        _locationPermission.close();
        _requestLocationResult.close();
        _listItemMapsPin.close();
    }

}
