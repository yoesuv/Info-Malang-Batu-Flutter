import 'package:flutter/material.dart';
import 'about_info.dart';
import 'about_changelog.dart';
import 'about_thanks.dart';
import 'about_libraries.dart';

class About extends StatefulWidget {

    AboutState createState() => AboutState();

}

class AboutState extends State<About> with TickerProviderStateMixin {

    TabController tabController;

    Widget build(BuildContext context) {
        tabController = TabController(length: 4, vsync: this);
        var tabBarItem = TabBar(
            tabs: <Widget>[
                Tab(text: 'Informasi'),
                Tab(text: 'Versi Rilis'),
                Tab(text: 'Terima Kasih'),
                Tab(text: 'Pustaka')
            ],
            isScrollable: true,
            controller: tabController,
        );

        return new DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                        title: Text('Tentang'),
                    bottom: tabBarItem,
                ),
                body: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                        AboutInfo(),
                        AboutChangelog(),
                        AboutThanks(),
                        AboutLibraries()
                    ],
                ),
            )
        );

    }

}
