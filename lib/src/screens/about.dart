import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/widgets/my_app_bar_text.dart';
import 'about_changelog.dart';
import 'about_info.dart';
import 'about_libraries.dart';
import 'about_thanks.dart';

class About extends StatefulWidget {

    @override
    AboutState createState() => AboutState();

}

class AboutState extends State<About> with TickerProviderStateMixin {

    TabController tabController;

    @override
    Widget build(BuildContext context) {
        tabController = TabController(length: 4, vsync: this);
        final TabBar tabBarItem = TabBar(
            tabs: const <Widget>[
                Tab(text: 'Informasi'),
                Tab(text: 'Versi Rilis'),
                Tab(text: 'Terima Kasih'),
                Tab(text: 'Pustaka')
            ],
            isScrollable: true,
            controller: tabController,
        );

        return DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                    title: const MyAppBarText(title: 'Tentang'),
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