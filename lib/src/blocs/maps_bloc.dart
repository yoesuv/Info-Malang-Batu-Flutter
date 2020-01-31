import 'package:rxdart/rxdart.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/maps/list_item_maps_pin_model.dart';
import '../models/service_model.dart';
import '../repositories/maps_repository.dart';
import '../services/app_exceptions.dart';

class MapsBloc {

    final MapsRepository _mapsRepository = MapsRepository();
    final PublishSubject<PermissionStatus> _locationPermission = PublishSubject<PermissionStatus>();
    final PublishSubject<PermissionStatus> _requestLocationResult = PublishSubject<PermissionStatus>();
    final PublishSubject<ServiceModel<ListItemMapsPinModel>> _listItemMapsPin = PublishSubject<ServiceModel<ListItemMapsPinModel>>();

    Stream<PermissionStatus> get permissionStatus => _locationPermission.stream;
    Stream<PermissionStatus> get requestLocationPermissionResult => _requestLocationResult.stream;
    Stream<ServiceModel<ListItemMapsPinModel>> get listItemMapsPins => _listItemMapsPin.stream;

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

    void getListMapsPin(){
        try {
            final Future<ListItemMapsPinModel> listMapsPin = _mapsRepository.getMapsPin();
            if (!_listItemMapsPin.isClosed) {
                listMapsPin.then((ListItemMapsPinModel result) {
                    _listItemMapsPin.sink.add(ServiceModel<ListItemMapsPinModel>.completed(result));
                });
            }
        } catch (e) {
            if (e is AppException) {
                if (!_listItemMapsPin.isClosed) {
                    _listItemMapsPin.sink.add(ServiceModel<ListItemMapsPinModel>.dioError(e));
                }
            } else {
                if (!_listItemMapsPin.isClosed) {
                    _listItemMapsPin.sink.add(ServiceModel<ListItemMapsPinModel>.error('Unknown Exception'));
                }
            }
        }

    }

    void dispose() {
        if (!_locationPermission.isClosed) {
            _locationPermission.close();
        }
        if (!_requestLocationResult.isClosed) {
            _requestLocationResult.close();
        }
        if (!_listItemMapsPin.isClosed) {
            _listItemMapsPin.close();
        }
    }

}