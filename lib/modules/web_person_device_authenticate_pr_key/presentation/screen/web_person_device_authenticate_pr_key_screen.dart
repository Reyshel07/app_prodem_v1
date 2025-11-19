import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/web_person_device_authenticate_pr_key/presentation/bloc/web_person_device_authenticate_pr_key_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class WebPersonDeviceAuthenticatePrKeyScreen extends StatefulWidget {
  const WebPersonDeviceAuthenticatePrKeyScreen({super.key});

  @override
  State<WebPersonDeviceAuthenticatePrKeyScreen> createState() =>
      _WebPersonDeviceAuthenticatePrKeyScreenState();
}

class _WebPersonDeviceAuthenticatePrKeyScreenState
    extends State<WebPersonDeviceAuthenticatePrKeyScreen> {
  final TextEditingController userController = TextEditingController();
  bool _esvisible = true;
  FocusNode passWordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<WebPersonDeviceAuthenticatePrKeyBloc>(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'PrMóvil',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              WebPersonDeviceAuthenticatePrKeyBloc,
              WebPersonDeviceAuthenticatePrKeyState
            >(
              builder: (context, state) {
                if (state is WebPersonDeviceAuthenticatePrKeySuccess) {
                  if (state.data.toInt() > 0) {
                    InjectorContainer.getIt<AppRouter>().push(
                      GetCurrentSmsOperationRoute(),
                    );
                  }
                }
                return Padding(
                  padding: EdgeInsets.all(topPadding * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.fingerprint, size: screenSize.height * 0.08),
                      SizedBox(height: screenSize.height * 0.08),
                      SizedBox(
                        width: screenSize.width * 0.8,
                        child: Card(
                          elevation: smallSpacing * 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.green,
                              ),
                              borderRadius: BorderRadius.all(
                                radiusCircular(12),
                              ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: userController,
                              obscureText: _esvisible,
                              textAlign: TextAlign.start,
                              maxLength: 4, // ← evita más de 4 dígitos
                              maxLines: 1,
                              focusNode: passWordFocus,
                              onChanged: (value) {
                                if (value.length == 4) {
                                  context
                                      .read<
                                        WebPersonDeviceAuthenticatePrKeyBloc
                                      >()
                                      .add(
                                        WebPersonDeviceAuthenPrKeyEvent(
                                          customerPIN: value,
                                          verifyPIN: true,
                                        ),
                                      );
                                }
                              },
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                counterText: "", // ← oculta el contador
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
                                hintText: "PIN de acceso",
                                hintStyle: AppTextStyles.mainStyleGreen16(
                                  context,
                                ),
                                isDense: false,
                                contentPadding: EdgeInsets.fromLTRB(
                                  16,
                                  8,
                                  16,
                                  8,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _esvisible
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye,
                                    color: Color(0xffa7a7a7),
                                    size: 22,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _esvisible = !_esvisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      Text(
                        'Si olvidó su PIN dirijase a cualquiera de nuestros Cajeros Automáticos ingresando a la opción PrNET.',
                        style: AppTextStyles.mainStyleGreen16Bold(context),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                );
              },
            ),
      ),
    );
  }
}
