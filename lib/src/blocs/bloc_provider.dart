import 'package:flutter/material.dart';
import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {

    final Widget child;
    final T bloc;

    const BlocProvider({Key key, @required this.bloc, @required this.child}): super(key: key);

    static T of<T extends Bloc>(BuildContext context) {
        final BlocProvider<T> provider = context.findAncestorWidgetOfExactType();
        return provider.bloc;
    }

    State createState() => _BlocProviderState();

}

class _BlocProviderState extends State<BlocProvider> {

    Widget build(BuildContext context) {
        return widget.child;
    }

    void dispose(){
        widget.bloc.dispose();
        super.dispose();
    }

}
