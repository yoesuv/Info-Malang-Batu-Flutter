import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/home_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/service_model.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_gallery.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';
import 'package:provider/provider.dart';

class Gallery extends StatefulWidget {

    @override
    GalleryState createState() => GalleryState();

}

class GalleryState extends State<Gallery> {

    HomeBloc bloc;

    @override
    void initState() {
        super.initState();
        bloc = Provider.of<HomeBloc>(context, listen: false);
        bloc.getListGallery();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const MyAppBarText(title: 'Galeri'),
            ),
            body: buildBody()
        );
    }

    Widget buildBody() {
        return StreamBuilder<ServiceModel<ListItemGalleryModel>>(
            stream: bloc.streamListGallery,
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
                return ItemGallery(itemGalleryModel: model.listItemGalleryModel[index]);
            }
        );
    }

}