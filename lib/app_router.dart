import 'package:flutter/material.dart';

const rootRoute = "/";
const formRoute = "/formRoute";

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(child: Text('Root Page')),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
