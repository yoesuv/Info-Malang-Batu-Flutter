import 'package:flutter/material.dart';
import 'list_place_bloc.dart';

class ListPlaceProvider extends InheritedWidget {

    final ListPlaceBloc bloc;

    ListPlaceProvider({Key key, Widget child}) : bloc = ListPlaceBloc(), super(key: key, child: child);

    bool updateShouldNotify(_) => true;

    static ListPlaceBloc of(BuildContext context) {
        return (context.inheritFromWidgetOfExactType(ListPlaceProvider) as ListPlaceProvider).bloc;
    }

}
