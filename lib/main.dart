import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/presentation/bloc/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTheme = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      title: 'Prodem',
      theme: providerTheme.currentTheme,
      routerConfig: appRouter,
    );
  }
}
