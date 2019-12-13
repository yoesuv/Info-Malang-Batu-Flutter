import 'package:rxdart/rxdart.dart';
import '../resources/list_gallery_provider.dart';
import '../models/gallery/list_item_gallery_model.dart';

class ListGalleryBloc {

    final _listGalleryProvider = ListGalleryProvider();
    final _listGallery = PublishSubject<ListItemGalleryModel>();

    Observable<ListItemGalleryModel> get listGallery => _listGallery.stream;

    getListGallery() async {
        final listGallery = await _listGalleryProvider.getListGallery();
        _listGallery.sink.add(listGallery);
    }

    dispose() {
        _listGallery.close();
    }

}
