import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.navigationShell, required this.child});

  final StatefulNavigationShell navigationShell;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
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
      currentIndex: navigationShell.currentIndex,
      onTap: (index) => navigationShell.goBranch(index),
    );
  }
}
