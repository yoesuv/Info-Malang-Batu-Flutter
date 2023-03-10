import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_changelog.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_info.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_libraries.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_thanks.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<About> with TickerProviderStateMixin {
  late TabController tabController;
  final tabs = const<Widget>[
    AboutInfo(),
    AboutChangelog(),
    AboutThanks(),
    AboutLibraries(),
  ];

  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 4, vsync: this);
    final TabBar tabBarItem = TabBar(
      tabs: const <Widget>[
        Tab(text: 'Informasi'),
        Tab(text: 'Versi Rilis'),
        Tab(text: 'Terima Kasih'),
        Tab(text: 'Pustaka'),
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
          children: tabs,
        ),
      ),
    );
  }
}
