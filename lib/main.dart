import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'injector.container.dart';
import 'utils/secure_hive.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  InjectorContainer.setupGetIt();
  await SecureHive.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = InjectorContainer.getIt<AppRouter>();
    //final providerTheme = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      title: 'Prodem',
      // theme: providerTheme.currentTheme,
      routerConfig: appRouter.config(),
    );
  }
}
