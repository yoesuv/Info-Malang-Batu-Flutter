import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/splash_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/states/splash_state.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/home.dart';

class Splash extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }

}

class _SplashState extends State<Splash> {

    late SplashBloc _bloc;

    @override
  void initState() {
    super.initState();
    _bloc = context.read<SplashBloc>();
  }

    @override
    Widget build(BuildContext context) {

        Future<void>.delayed(const Duration(seconds: 2), (){
            Navigator.pushNamedAndRemoveUntil(context, Home.routeHome, ModalRoute.withName('/'));
        });

        return Scaffold(
            body: Container(
                color: Colors.teal,
                child: Stack(
                    children: <Widget>[
                        const Center(
                            child: Text('Info Malang Batu', style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'Pacifico',
                                color: Colors.white
                            ))
                        ),
                        _appVersion(),
                    ]
                )
            )
        );
    }

    Widget _appVersion() {
      return BlocBuilder<SplashBloc, SplashState>(
        bloc: _bloc,
        builder: (context, state) {
          return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text('versi ${state.version}', style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white
                  ))
              )
          );
        },
      );
    }

}