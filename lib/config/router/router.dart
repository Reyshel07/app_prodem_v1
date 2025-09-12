import 'package:app_prodem_v1/presentation/screen/Register/account_settings_screen.dart';
import 'package:app_prodem_v1/presentation/screen/Register/configuration%20steps/configuration_steps_screen.dart';
import 'package:app_prodem_v1/presentation/screen/Register/regtister_screen.dart';
import 'package:app_prodem_v1/presentation/screen/home/home_screen.dart';
import 'package:app_prodem_v1/presentation/screen/Register/password_screen.dart';
import 'package:app_prodem_v1/presentation/screen/four%20initial%20payments/payment_of_services/payment_of_services_screen.dart';
import 'package:app_prodem_v1/presentation/screen/settings_screen.dart/virtuelles%20Ticket/virtuelles_ticket_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: RegisterScreeen.path,
  routes: [
    GoRoute(
      path: RegisterScreeen.path,
      name: RegisterScreeen.name,
      builder: (context, state) => RegisterScreeen(),
    ),
    GoRoute(
      path: AccountSettingsScreen.path,
      name: AccountSettingsScreen.name,
      builder: (context, state) => AccountSettingsScreen(),
    ),
    GoRoute(
      path: PasswordScreenProdem.path,
      name: PasswordScreenProdem.name,
      builder: (context, state) => const PasswordScreenProdem(),
    ),
    GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: ConfigurationStepsScreen.path,
      name: ConfigurationStepsScreen.name,
      builder: (context, state) => ConfigurationStepsScreen(),
    ),
    GoRoute(
      path: PaymentOfServicesScreen.path,
      name: PaymentOfServicesScreen.name,
      builder: (context, state) => PaymentOfServicesScreen(),
    ),
    GoRoute(
      path: VirtuellesTicketScreen.path,
      name: VirtuellesTicketScreen.name,
      builder: (context, state) => VirtuellesTicketScreen(),
    ),
  ],
);
