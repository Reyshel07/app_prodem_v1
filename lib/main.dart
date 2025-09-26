import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'injector.container.dart';
import 'utils/secure_hive.dart';

void main() async {
  ///This .env file contains the private URL.
  await dotenv.load(fileName: '.env');

  ///This is the main container where all containers will be declared.
  InjectorContainer.setupGetIt();

  ///hive declaration
  await SecureHive.init();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = InjectorContainer.getIt<AppRouter>();
    return MaterialApp.router(
      title: 'Prodem',
      routerConfig: appRouter.config(),
    );
  }
}
