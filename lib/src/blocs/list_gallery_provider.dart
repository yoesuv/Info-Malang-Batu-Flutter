import 'package:flutter/material.dart';
import 'list_gallery_bloc.dart';
export 'list_gallery_bloc.dart';

class ListGalleryProvider extends InheritedWidget {

    final ListGalleryBloc bloc;

    ListGalleryProvider({Key key, Widget child}) : bloc = ListGalleryBloc(), super(key: key, child: child);

    bool updateShouldNotify(_) => true;

    static ListGalleryBloc of(BuildContext context) {
        return (context.inheritFromWidgetOfExactType(ListGalleryProvider) as ListGalleryProvider).bloc;
    }

}
