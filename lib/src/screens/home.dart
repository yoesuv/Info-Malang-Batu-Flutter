import 'package:flutter/material.dart';

class Home extends StatelessWidget {

    void _onItemTapped(int index){
        print('Home # index $index');
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Home'),
            ),
            body: Center(
                child: Text('Info Malang Batu'),
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
            elevation: 8.0,
            onTap: _onItemTapped,
        );
    }
}
