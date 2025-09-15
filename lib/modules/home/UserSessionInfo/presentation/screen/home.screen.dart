import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/modules/auth/sign_in/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InjectorContainer.getIt<SessionInfoBloc>(),
      child: Scaffold(body: Body()),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
