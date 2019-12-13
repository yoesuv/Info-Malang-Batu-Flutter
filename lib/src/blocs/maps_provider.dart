import 'package:flutter/material.dart';
import 'maps_bloc.dart';
export 'maps_bloc.dart';

class MapsProvider extends InheritedWidget {

    final MapsBloc bloc;

    MapsProvider({Key key, Widget child}) : bloc = MapsBloc(), super(key: key, child: child);

    bool updateShouldNotify(_) => true;

    static MapsBloc of(BuildContext context) {
        return context.dependOnInheritedWidgetOfExactType<MapsProvider>().bloc;
    }

}
