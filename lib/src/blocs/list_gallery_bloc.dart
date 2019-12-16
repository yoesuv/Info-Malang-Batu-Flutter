import 'package:rxdart/rxdart.dart';
import '../repositories/list_gallery_repository.dart';
import '../models/gallery/list_item_gallery_model.dart';

class ListGalleryBloc {

    final _listGalleryRepository = ListGalleryRepository();
    final _listGallery = PublishSubject<ListItemGalleryModel>();

    Observable<ListItemGalleryModel> get listGallery => _listGallery.stream;

    getListGallery() async {
        final listGallery = await _listGalleryRepository.getListGallery();
        _listGallery.sink.add(listGallery);
    }

    dispose() {
        _listGallery.close();
    }

}
