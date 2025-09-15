import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:flutter/material.dart';
import 'modules/auth/sign_in/injector.container.dart';

void main() async {
  InjectorContainer.setupGetIt();

  runApp(
    MainApp(),
    //MultiProvider(
    //  providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
    //  child: MainApp(),
    //),
  );
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
