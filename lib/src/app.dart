import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/list_place_detail.dart';
import 'screens/gallery_detail.dart';
import 'blocs/list_place_provider.dart';
import 'blocs/list_gallery_provider.dart';
import 'blocs/maps_provider.dart';
import 'blocs/about_provider.dart';

class App extends StatelessWidget {

    Widget build(BuildContext context) {
        return ListPlaceProvider (
            child: ListGalleryProvider (
                child: MapsProvider (
                    child: AboutProvider (
                        child: MaterialApp (
                            title: 'Info Malang Batu',
                            theme: ThemeData(
                                primaryColor: Colors.teal,
                                accentColor: Colors.white
                            ),
                            onGenerateRoute: routes
                        )
                    )
                )
            )
        );
    }

    Route routes(RouteSettings settings) {
        print(settings.name);
        if (settings.name == '/') {
            return MaterialPageRoute(
                builder: (context) {
                    return Home();
                }
            );
        } else if (settings.name == '/detailPlace') {
            return MaterialPageRoute(
                builder: (context) {
                    return ListPlaceDetail();
                }
            );
        } else {
            return MaterialPageRoute(
                builder: (context) {
                    return GalleryDetail();
                }
            );
        }
    }

}
