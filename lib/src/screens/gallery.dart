import 'package:flutter/material.dart';
import '../blocs/list_gallery_provider.dart';
import '../models/gallery/list_item_gallery_model.dart';
import '../widgets/item_gallery.dart';

class Gallery extends StatelessWidget {

    Widget build(BuildContext context) {

        final ListGalleryBloc bloc = ListGalleryProvider.of(context);
        bloc.getListGallery();

        return Scaffold(
            appBar: AppBar(
                title: Text('Galeri', style: TextStyle(
                    fontFamily: 'Pacifico'
                )),
            ),
            body: buildBody(bloc)
        );
    }

    Widget buildBody(ListGalleryBloc bloc) {
        return StreamBuilder(
            stream: bloc.listGallery,
            builder: (BuildContext context, AsyncSnapshot<ListItemGalleryModel> snapshot) {
                if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator()
                    );
                }
                return GridView.builder(
                    itemCount: snapshot.data.listItemGalleryModel.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, index) {
                        return ItemGallery(itemGalleryModel: snapshot.data.listItemGalleryModel[index]);
                    }
                );
            },
        );
    }

}
