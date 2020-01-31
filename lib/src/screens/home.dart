import 'package:flutter/material.dart';
import 'about.dart';
import 'gallery.dart';
import 'list_place.dart';
import 'maps_place.dart';

class Home extends StatefulWidget {

    static const String routeHome = '/home';

    @override
    HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

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
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: menu.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: buildBottomNavigationBar()
        );
    }

    Widget buildBottomNavigationBar() {
        return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: const Text('Lokasi')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.image),
                    title: const Text('Galeri')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    title: const Text('Peta')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    title: const Text('Tentang')
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