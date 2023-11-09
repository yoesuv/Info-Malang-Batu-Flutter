import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/gallery_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/gallery_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/states/gallery_state.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_gallery.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GalleryState();
  }
}

class _GalleryState extends State<Gallery> {
  late GalleryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<GalleryBloc>()..add(GalleryEventInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyAppBarText(title: 'Galeri'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return BlocBuilder<GalleryBloc, GalleryState>(
      bloc: _bloc,
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.listItemGalleryModel != current.listItemGalleryModel,
      builder: (context, state) {
        if (state.status == FormzSubmissionStatus.inProgress) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            ),
          );
        } else if (state.status == FormzSubmissionStatus.success) {
          return _buildGallery(state.listItemGalleryModel);
        }
        return Container();
      },
    );
  }

  Widget _buildGallery(ListItemGalleryModel? model) {
    return GridView.builder(
      itemCount: model?.listItemGalleryModel.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ItemGallery(
          itemGalleryModel: model?.listItemGalleryModel[index],
        );
      },
    );
  }
}
