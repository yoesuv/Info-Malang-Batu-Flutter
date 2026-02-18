import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/gallery_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/gallery_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/states/gallery_state.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/error_container.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_gallery.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

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
      appBar: AppBar(title: const MyAppBarText(title: 'Galeri')),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return BlocBuilder<GalleryBloc, GalleryState>(
      bloc: _bloc,
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.listGallery != current.listGallery,
      builder: (context, state) {
        if (state.status.isInProgress) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            ),
          );
        } else if (state.status.isFailure) {
          return ErrorContainer(
            title: 'Failed Load Galleries',
            onPress: () {
              _bloc.add(GalleryEventInit());
            },
          );
        }
        return _buildGallery(state.listGallery);
      },
    );
  }

  Widget _buildGallery(List<ItemGalleryModel>? listGallery) {
    return GridView.builder(
      itemCount: listGallery?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ItemGallery(itemGalleryModel: listGallery?[index]);
      },
    );
  }
}
