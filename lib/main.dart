import 'package:flutter/material.dart';
import 'package:scan_me/app_router.dart';
import 'package:scan_me/scanner/view/scanner_page.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/services/catalogue_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CatalogueService>(
          create: (_) => CatalogueService(),
        ),
      ],
      child: MaterialApp(
        title: 'Scan Me',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScannerPage(),
      ),
    );
  }
}
