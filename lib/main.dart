import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/modules/home/settings_screen/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'injector.container.dart';
import 'utils/secure_hive.dart';

void main() async {
  ///This .env file contains the private URL.
  await dotenv.load(fileName: '.env');

  ///This is the main container where all containers will be declared.
  InjectorContainer.setupGetIt();

  ///hive declaration
  await SecureHive.init();

  runApp(
    BlocProvider<ThemeCubit>.value(
      value: InjectorContainer.getIt<ThemeCubit>(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = InjectorContainer.getIt<AppRouter>();
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp.router(
          title: 'Prodem',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,

          /// Aquí agregamos las localizaciones
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          /// Soporte para idiomas (español e inglés por ejemplo)
          supportedLocales: const [
            Locale('es', ''), // Español
            Locale('en', ''), // Inglés
          ],
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}
