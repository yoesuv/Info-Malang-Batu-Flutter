import 'package:flutter/material.dart';

import 'list_place.dart';
import 'gallery.dart';
import 'maps_place.dart';
import 'about.dart';

class Home extends StatefulWidget {
    Home({Key key}) : super(key: key);
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
                    title: Text('Lokasi')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.image),
                    title: Text('Galeri')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    title: Text('Peta')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    title: Text('Tentang')
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
