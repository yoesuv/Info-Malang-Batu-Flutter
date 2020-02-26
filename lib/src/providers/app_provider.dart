import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:info_malang_batu_flutter/src/blocs/home_bloc.dart';
import 'package:info_malang_batu_flutter/src/blocs/about_bloc.dart';

 List<SingleChildWidget> listProvider = <SingleChildWidget>[
    Provider<HomeBloc>(create: (_) => HomeBloc()),
    Provider<AboutBloc>(create: (_) => AboutBloc())
];