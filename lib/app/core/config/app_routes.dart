import 'package:flutter/material.dart';

import '../../pages/home/home_page.dart';
import '../../pages/politician_details/politician_details_page.dart';

class AppRoutes {
  static String get initialRoute => home;

  static const home = '/';
  static const politicianDetails = '/politician-details';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomePage(),
    politicianDetails: (context) => PoliticianDetailsPage(
      politicianId: ModalRoute.of(context)!.settings.arguments as int,
    )
  };
}