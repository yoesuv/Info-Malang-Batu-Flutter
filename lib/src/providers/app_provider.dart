import 'package:provider/provider.dart';
import '../blocs/list_place_bloc.dart';
import '../blocs/list_gallery_bloc.dart';
import '../blocs/maps_bloc.dart';
import '../blocs/about_bloc.dart';

class AppProvider {

    static List<SingleChildCloneableWidget> listProvider = [
        Provider<ListPlaceBloc>(create: (_) => ListPlaceBloc()),
        Provider<ListGalleryBloc>(create: (_) => ListGalleryBloc()),
        Provider<MapsBloc>(create: (_) => MapsBloc()),
        Provider<AboutBloc>(create: (_) => AboutBloc())
    ];

}
