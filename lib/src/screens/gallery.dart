import 'package:flutter/material.dart';
import '../blocs/list_gallery_provider.dart';
import '../models/list_item_gallery_model.dart';
import '../widgets/item_gallery.dart';

class Gallery extends StatelessWidget {

    Widget build(BuildContext context) {

        final ListGalleryBloc bloc = ListGalleryProvider.of(context);
        bloc.getListGallery();

        return Scaffold(
            appBar: AppBar(
                title: Text('Galeri'),
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
                        String imageUrl = snapshot.data.listItemGalleryModel[index].thumbnail;
                        return ItemGallery(imageUrl: imageUrl);
                    }
                );
            },
        );
    }

}
