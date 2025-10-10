import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
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
    text: 'dev001',
  );

  FocusNode passWordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    //final double topPadding = screenSize.height * 0.2;
    //final double containerSize = screenSize.height * 0.3;
    //final double imgSize = screenSize.width * 0.4;
    //String text;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(title: Text(state.message));
                },
              );
            }
            if (state is AuthSuccess) {
              InjectorContainer.getIt<AppRouter>().push(HomeRoute());
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        keyboardType: TextInputType.text,
                        controller: userController,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        focusNode: passWordFocus,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          hintText: "Usuario",
                          hintStyle: AppTextStyles.mainStyleGreen16(context),
                          filled: false,
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.5,
                  child: Card(
                    elevation: smallSpacing * 0.5,
                    child: Butoon1(
                      onTap: () {
                        String username = userController.text;
                        String password = 'Prodem123';
                        int chanel = 1;
                        List<AditionalItemEntity> aditionalItems = [
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
