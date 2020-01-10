import 'package:flutter/material.dart';
import '../blocs/list_gallery_bloc.dart';
import '../models/service_model.dart';
import '../models/gallery/list_item_gallery_model.dart';
import '../widgets/item_gallery.dart';

class Gallery extends StatefulWidget {

    Gallery({Key key}) : super(key: key);
    GalleryState createState() => GalleryState();

}

class GalleryState extends State<Gallery> {

    ListGalleryBloc bloc = ListGalleryBloc();

    void initState() {
        super.initState();
        bloc.getListGallery();
    }

    Widget build(BuildContext context) {
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
            builder: (BuildContext context, AsyncSnapshot<ServiceModel<ListItemGalleryModel>> snapshot) {
                if (snapshot.hasData) {
                    switch (snapshot.data.status) {
                        case Status.COMPLETED:
                            return buildGallery(snapshot.data.data);
                        break;
                        case Status.ERROR:
                            return Center(
                                child: Text(snapshot.data.message)
                            );
                        break;
                        case Status.DIOERROR:
                            return Center(
                                child: Text(snapshot.data.error.dioError.message)
                            );
                        break;
                    }
                }
                return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)
                    )
                );
            }
        );
    }

    Widget buildGallery(ListItemGalleryModel model) {
        return GridView.builder(
            itemCount: model.listItemGalleryModel.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
                return ItemGallery(itemGalleryModel: model.listItemGalleryModel[index]);
            }
        );
    }

    dispose(){
        bloc.dispose();
        super.dispose();
    }

}
