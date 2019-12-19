import 'package:rxdart/rxdart.dart';
import '../repositories/list_gallery_repository.dart';
import '../models/service_model.dart';
import '../models/gallery/list_item_gallery_model.dart';
import '../services/app_exceptions.dart';

class ListGalleryBloc {

    final _listGalleryRepository = ListGalleryRepository();
    final _listGallery = PublishSubject<ServiceModel<ListItemGalleryModel>>();

    Observable<ServiceModel<ListItemGalleryModel>> get listGallery => _listGallery.stream;

    getListGallery() async {
        try {
            final listGallery = await _listGalleryRepository.getListGallery();
            _listGallery.sink.add(ServiceModel.completed(listGallery));
        } catch (e) {
            if (e is AppException) {
                _listGallery.sink.add(ServiceModel.dioError(e));
            } else {
                _listGallery.sink.add(ServiceModel.error('Unknown Exception'));
            }
        }

    }

    dispose() {
        _listGallery.close();
    }

}
