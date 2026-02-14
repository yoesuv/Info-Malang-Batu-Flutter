import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_info_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/about_info_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/about_info_state.dart';
import 'package:info_malang_batu_flutter/src/data/dimens.dart';

class AboutInfo extends StatefulWidget {
  const AboutInfo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AboutInfoState();
  }
}

class _AboutInfoState extends State<AboutInfo> {
  late AboutInfoBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AboutInfoBloc()..add(AboutInfoEventInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: itemChangelogPadding),
            child: const Text(
              'Info Malang Batu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
          ),
          _buildAppVersion(),
          Container(
            padding: EdgeInsets.symmetric(vertical: itemChangelogPadding),
            child: const Text(
              'Flutter Version',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Container(
            padding: EdgeInsets.all(itemChangelogPadding),
            child: const Text(
              'https://github.com/yoesuv/Info-Malang-Batu-Flutter',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppVersion() {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, AboutInfoState state) {
        return Text(
          'Versi ${state.version}',
          style: const TextStyle(fontSize: 14),
        );
      },
    );
  }
}
