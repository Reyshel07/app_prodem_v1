import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../../config/router/router.dart';
import '../../../../../utils/text.dart';
import '../../domain/entities/entities.dart';
import '../bloc/bloc.dart';

@RoutePage()
class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InjectorContainer.getIt<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Bienvenido a Banco Prodem S.A.',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController userController = TextEditingController(
    text: 'quique',
  );
  final FocusNode passWordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;

    return BlocProvider(
      create: (_) => InjectorContainer.getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Mensaje',
                    style: AppTextStyles.mainStyleGreen14Bold(context),
                  ),
                  content: Text(
                    state.message,
                    style: AppTextStyles.mainStyleGreen14(context),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'OK',
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                    ),
                  ],
                );
              },
            );
          }

          if (state is AuthSuccess) {
            InjectorContainer.getIt<AppRouter>().push(HomeRoute());
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TextField usuario
                    SizedBox(
                      width: screenSize.width * 0.8,
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.green,
                            ),
                            borderRadius: BorderRadius.all(radiusCircular(12)),
                          ),
                          child: TextField(
                            controller: userController,
                            focusNode: passWordFocus,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              hintText: "Usuario",
                              hintStyle: AppTextStyles.mainStyleGreen16(
                                context,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.fromLTRB(
                                16,
                                8,
                                16,
                                8,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: smallSpacing),

                    // Botón login
                    Butoon1(
                      onTap: () {
                        if (state is AuthLoading) return;
                        final username = userController.text;
                        final password = 'Prodem*123';
                        final int chanel = 1;
                        final aditionalItems = [
                          AditionalItemEntity(
                            key: 'IP',
                            value: '192.168.162.12',
                          ),
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
                      },
                      lblTextField: 'INGRESAR',
                    ),
                  ],
                ),
              ),

              // Loader overlay
              if (state is AuthLoading) Loading1(smallSpacing: smallSpacing),
            ],
          );
        },
      ),
    );
  }
}
