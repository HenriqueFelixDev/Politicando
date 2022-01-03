import 'package:flutter/material.dart';
import 'package:politicando/app/core/controllers/politicians_controller.dart';
import 'package:politicando/app/core/repositories/politicians_repository_dio.dart';
import 'package:provider/provider.dart';

import './core/config/app_routes.dart';
import './core/config/app_config.dart';
import './core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PoliticiansController(PoliticiansRepositoryDio()),
      builder: (_, __) {
        return MaterialApp(
          theme: AppTheme.light(),
          title: AppConfig.appName,
          routes: AppRoutes.routes
        );
      },
    );
  }
}