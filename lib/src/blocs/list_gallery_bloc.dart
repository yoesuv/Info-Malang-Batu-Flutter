import 'package:rxdart/rxdart.dart';
import '../models/gallery/list_item_gallery_model.dart';
import '../models/service_model.dart';
import '../repositories/list_gallery_repository.dart';
import '../services/app_exceptions.dart';

class ListGalleryBloc {

    final ListGalleryRepository _listGalleryRepository = ListGalleryRepository();
    final PublishSubject<ServiceModel<ListItemGalleryModel>> _listGallery = PublishSubject<ServiceModel<ListItemGalleryModel>>();

    Stream<ServiceModel<ListItemGalleryModel>> get listGallery => _listGallery.stream;

    void getListGallery() {
        try {
            final Future<ListItemGalleryModel> listGallery = _listGalleryRepository.getListGallery();
            if (!_listGallery.isClosed) {
                listGallery.then((ListItemGalleryModel result) {
                    _listGallery.sink.add(ServiceModel<ListItemGalleryModel>.completed(result));
                });
            }
        } catch (e) {
            if (e is AppException) {
                if (!_listGallery.isClosed) {
                    _listGallery.sink.add(ServiceModel<ListItemGalleryModel>.dioError(e));
                }
            } else {
                if (!_listGallery.isClosed) {
                    _listGallery.sink.add(ServiceModel<ListItemGalleryModel>.error('Unknown Exception'));
                }
            }
        }

    }

    void dispose() {
        if (!_listGallery.isClosed) {
            _listGallery.close();
        }
    }

}