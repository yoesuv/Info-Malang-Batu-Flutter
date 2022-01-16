import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/home_bloc.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/maps_place.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

    static const String routeHome = '/home';

    @override
    HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

    late HomeBloc bloc;
    int _selectedIndex = 0;
    final List<Widget> menu = <Widget>[
        ListPlace(),
        Gallery(),
        MapsPlace(),
        About()
    ];

    void _onItemTapped(int index){
        setState(() {
            _selectedIndex = index;
        });
    }

    @override
  void initState() {
    super.initState();
    bloc = Provider.of<HomeBloc>(context, listen: false);
  }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: menu.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: buildBottomNavigationBar()
        );
    }

    @override
    void dispose() {
        bloc.dispose();
        super.dispose();
    }

    Widget buildBottomNavigationBar() {
        return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Lokasi'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.image),
                    label: 'Galeri'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    label: 'Peta'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    label: 'Tentang'
                )
            ],
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey[700],
            selectedItemColor: Colors.teal,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
        );
    }

}