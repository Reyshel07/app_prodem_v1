import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/modules/auth/sign_in/domain/entities/sign_in_entity.dart';
import 'package:app_prodem_v1/modules/auth/sign_in/presentation/bloc/auth_bloc.dart';
import 'package:app_prodem_v1/modules/auth/sign_in/presentation/screens/prueba.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:go_router/go_router.dart';

@RoutePage()
class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    //final authBloc = AuthBloc(SignInResponseRepositoryImpl());
    return BlocProvider(
      create: (context) => InjectorContainer.getIt<AuthBloc>(),
      //create: (context) => AuthBloc(SignInResponseRepositoryImpl()),
      child: Scaffold(body: Body()),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    String text = '';
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              text = 'Crgando';
            }
          },
          child: Column(
            children: [
              Text(text),
              TextFormField(decoration: InputDecoration(labelText: 'Username')),
              TextFormField(decoration: InputDecoration(labelText: 'password')),
              ElevatedButton(
                onPressed: () {
                  String username = 'PRUEBA030';
                  String password = 'PRODEM1231';
                  int chanel = 1;
                  List<AditionalItemEntity> aditionalItems = [
                    AditionalItemEntity(key: 'IP', value: '192.168.162.12'),
                    AditionalItemEntity(
                      key: 'SmartphoneIMEI',
                      value: '45165sdwe45we46-PC',
                    ),
                  ];
                  context.read<AuthBloc>().add(
                    SignInEvent(
                      username: username,
                      password: password,
                      chanel: chanel,
                      aditionalItems: aditionalItems,
                    ),
                  );
                  //context.pushRoute(PruebaRoute());
                  /*InjectorContainer.getIt<AppRouter>().push(
                          PruebaRoute(text: 'hola'),
                        );*/
                },
                child: Text('Login'),
              ),
            ],
          ),
        );
      },
    );
  }
}
