import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/providers/app_provider.dart';
import 'package:info_malang_batu_flutter/src/core/routes/routes.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: listProvider,
            child: MaterialApp (
                title: 'Info Malang Batu',
                theme: ThemeData(
                    primaryColor: Colors.teal,
                    accentColor: Colors.white
                ),
                onGenerateRoute: Routes.routes
            )
        );

    }

}