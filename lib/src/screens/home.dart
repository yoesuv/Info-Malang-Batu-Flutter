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
                    title: Text('List')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.image),
                    title: Text('Gallery')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    title: Text('Maps')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.info_outline),
                    title: Text('About')
                )
            ],
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blueAccent,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
        );
    }

}
