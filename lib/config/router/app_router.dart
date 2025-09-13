import 'package:app_prodem_v1/modules/auth/sign_in/presentation/screens/login_screen1.dart';
import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute1.page, initial: true),
    AutoRoute(page: PruebaRoute.page),
    //AutoRoute(page: LoginScreen1.page, initial: true),
  ];
}
