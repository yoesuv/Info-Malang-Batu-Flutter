import 'package:flutter/material.dart';

class MyAppBarText extends StatelessWidget {
  const MyAppBarText({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(title ?? '', style: const TextStyle(fontFamily: 'Pacifico'));
  }
}
