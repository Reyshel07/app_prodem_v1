import 'dart:convert';
import 'dart:typed_data';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/presentation/bloc/get_account_numberln_other_bank_bloc.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/presentation/bloc/get_current_qr_by_type_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

@RoutePage()
class CurrentQrByTypeScreen extends StatelessWidget {
  final SessionInfoBloc sessionBloc;

  const CurrentQrByTypeScreen({super.key, required this.sessionBloc});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<GetCurrentQrByTypeBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<GetAccountNumberlnOtherBankBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Depósito desde otras Entidades',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<GetCurrentQrByTypeBloc>()
                ..add(GetCurrentQrEvent()),
          child: BlocBuilder<GetCurrentQrByTypeBloc, GetCurrentQrByTypeState>(
            builder: (context, state) {
              if (state is GetCurrentQrByTypeSuccess) {
                final res = state.getCurrentQrByTypeResponseEntity;
                Uint8List bytes = base64Decode(res.data.qr);
                return Padding(
                  padding: EdgeInsets.all(topPadding * 0.05),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          Html(
                            data: res.data.mensajeQr,
                            style: {
                              "h4": Style(
                                fontSize: FontSize(10.0),
                                textAlign: TextAlign.justify,
                              ),
                              "h1": Style(
                                fontSize: FontSize(16.0),
                                color: Theme.of(context).colorScheme.green,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.justify,
                              ),
                              "li": Style(
                                padding: HtmlPaddings.symmetric(vertical: 4),
                                fontSize: FontSize(8.0),
                                textAlign: TextAlign.justify,
                              ),
                            },
                          ),
                          Card(
                            elevation: smallSpacing * 0.5,
                            child: SizedBox(
                              width: screenSize.width * 0.6,
                              height: screenSize.height * 0.25,
                              child: Image.memory(bytes, fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(height: smallSpacing * 0.5),
                          Card(
                            elevation: smallSpacing * 0.5,
                            child: SizedBox(
                              width: screenSize.width * 0.4,
                              child: ButoonIcon1(
                                icon: Icons.share,
                                onTap: () {},
                                lblTextField: 'Descargar QR',
                              ),
                            ),
                          ),
                          SizedBox(height: smallSpacing * 0.5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BlocConsumer<
                                GetAccountNumberlnOtherBankBloc,
                                GetAccountNumberlnOtherBankState
                              >(
                                listener: (context, state) {
                                  if (state
                                      is GetAccountNumberlnOtherBankSuccess) {
                                    InjectorContainer.getIt<AppRouter>().push(
                                      AccountNumberlnOtherBankRoute(
                                        sessionBloc: sessionBloc,
                                      ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  return ContainerIconText(
                                    onTap: () {
                                      context
                                          .read<
                                            GetAccountNumberlnOtherBankBloc
                                          >()
                                          .add(GetAccountNumOtherBankEvent());
                                    },
                                    smallSpacing: smallSpacing,
                                    topPadding: topPadding,
                                    screenSize: screenSize,
                                    text: 'Nueva solicitud',
                                    icon: Icons.qr_code,
                                  );
                                },
                              ),
                              ContainerIconText(
                                onTap: () {},
                                smallSpacing: smallSpacing,
                                topPadding: topPadding,
                                screenSize: screenSize,
                                text: 'Bandeja de solicitud',
                                icon: Icons.list,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class ContainerIconText extends StatelessWidget {
  const ContainerIconText({
    super.key,
    required this.smallSpacing,
    required this.topPadding,
    required this.screenSize,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final double smallSpacing;
  final double topPadding;
  final Size screenSize;
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: smallSpacing * 0.5,
        child: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Container(
            height: screenSize.height * 0.11,
            width: screenSize.width * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.green),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.green,
                  size: screenSize.height * 0.06,
                ),
                Text(
                  text,
                  style: AppTextStyles.mainStyleGreen12Bold(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
