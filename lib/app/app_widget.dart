import 'package:flutter/material.dart';
import './core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(
        appBar: AppBar(title: Text('Politicando')),
      )
    );
  }
}