import 'package:flutter/material.dart';
import 'package:scan_me/form/view/form_page.dart';
import 'package:scan_me/scanner/data/scanner_item.dart';
import 'package:scan_me/scanner/view/scanner_page.dart';
import 'package:scan_me/success/success_page.dart';

const rootRoute = "/";
const formRoute = "/formRoute";
const successRoute = '/successRoute';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ScannerPage(),
        );
      case formRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => FormPage(scannerItem: settings.arguments as ScannerItem),
        );
      case successRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SuccessPage(),
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
