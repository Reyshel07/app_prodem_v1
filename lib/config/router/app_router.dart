import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  //AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute1.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: AccountInquiryRoute.page),
    AutoRoute(page: SavingAccountExtractDataTranSacreen.page),
    AutoRoute(page: SavingAccountDataRoute.page),
  ];
}
