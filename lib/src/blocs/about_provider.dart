import 'package:flutter/material.dart';
import 'about_bloc.dart';
export 'about_bloc.dart';

class AboutProvider extends InheritedWidget {

    final AboutBloc bloc;

    AboutProvider({Key key, Widget child}) : bloc = AboutBloc(), super(key: key, child: child);

    bool updateShouldNotify(_) => true;

    static AboutBloc of(BuildContext context) {
        return context.dependOnInheritedWidgetOfExactType<AboutProvider>().bloc;
    }

}
