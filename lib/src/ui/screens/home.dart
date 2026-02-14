import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/maps_place.dart';

class Home extends StatefulWidget {
  static const String routeHome = '/home';

  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> menu = const <Widget>[
    ListPlace(),
    Gallery(),
    MapsPlace(),
    About(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: menu.elementAt(_selectedIndex)),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Lokasi'),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Galeri'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Peta'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
      ],
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[700],
      selectedItemColor: Colors.teal,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
