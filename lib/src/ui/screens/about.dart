import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_bloc.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_changelog.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_info.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_libraries.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_thanks.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';
import 'package:provider/provider.dart';

class About extends StatefulWidget {

    @override
    AboutState createState() => AboutState();

}

class AboutState extends State<About> with TickerProviderStateMixin {

    TabController tabController;
    AboutBloc bloc;

    @override
    void initState() {
        super.initState();
        bloc = Provider.of<AboutBloc>(context, listen: false);
    }

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
                        AboutChangelog(bloc),
                        AboutThanks(),
                        AboutLibraries(bloc)
                    ],
                ),
            )
        );

    }

}