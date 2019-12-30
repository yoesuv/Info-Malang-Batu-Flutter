import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_provider.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {

    Widget build(BuildContext context) {
        return MultiProvider(
            providers: AppProvider.listProvider,
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
