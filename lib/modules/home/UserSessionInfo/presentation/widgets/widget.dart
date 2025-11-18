import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../domain/entities/entity.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            InjectorContainer.getIt<AppRouter>().push(SettingsRoute());
          },
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.green,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              InjectorContainer.getIt<AppRouter>().push(
                WebPersonDeviceAuthenticatePrKeyRoute(),
              );
            },
            icon: Icon(
              Icons.qr_code_2_rounded,
              color: Theme.of(context).colorScheme.green,
            ),
          ),
        ],
        title: Center(
          child: Text(
            'ProdemMovil',
            style: AppTextStyles.mainStyleGreen25Bold(context),
          ),
        ),
      ),
    );
  }
}

class ListCards extends StatelessWidget {
  const ListCards({
    super.key,
    required this.screenSize,
    required this.todasList,
    required this.smallSpacing,
    required this.topPadding,
  });

  final Size screenSize;
  final List<CuentaConTipo<ListCodeCreditLineElementEntity>> todasList;
  final double smallSpacing;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.17,
      width: screenSize.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: todasList.length,
        itemBuilder: (BuildContext context, int index) {
          final account = todasList[index];
          final tipo = account.tipo;
          final data1 = account.data;
          String nombre;
          String estado;
          String imagen;
          String icon;
          switch (tipo) {
            case "cuenta":
              nombre = "CUENTA DE AHORRO:";
              estado = "ESTADO";
              imagen = "assets/img/fondoverde1.png";
              icon = "assets/img/check_movements.svg";
              break;
            case "dpf":
              nombre = "DPF:";
              estado = "VENCIMIENTO";
              imagen = "assets/img/fondoazul1.png";
              icon = "assets/img/check_movements.svg";
              break;
            case "credito":
              nombre = "CREDITO:";
              estado = "ESTADO";
              imagen = "assets/img/fondonegro1.png";
              icon = "assets/img/payment_credit.svg";
              break;
            case "targeta":
            default:
              nombre = "TARGETA DE CREDITO:";
              estado = "ESTADO";
              imagen = "assets/img/fondonegro1.png";
              icon = "assets/img/payment_creditcard.svg";
              break;
          }
          return SizedBox(
            height: screenSize.height * 0.17,
            width: screenSize.width * 0.95,
            child: Card(
              margin: EdgeInsetsDirectional.all(8),
              elevation: smallSpacing * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(imagen, fit: BoxFit.fill),
                    Padding(
                      padding: EdgeInsets.all(topPadding * 0.05),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SALDO',
                                    textAlign: TextAlign.start,
                                    style: AppTextStyles.mainStyleWhite12(
                                      context,
                                    ),
                                  ),
                                  Text(
                                    data1.balance,
                                    style: AppTextStyles.mainStyleWhite20Bold(
                                      context,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (nombre == 'CUENTA DE AHORRO') {
                                    /*InjectorContainer.getIt<AppRouter>().push(
                                      SavingAccountExtractDataTranRoute(
                                        sessionBloc: ,
                                        bloc: 
                                      ),
                                    );*/
                                  } else if (nombre == 'VENCIMIENTO') {
                                    /*InjectorContainer.getIt<AppRouter>().push(
                                      SavingAccountExtractDataTranRoute(
                                        sessionBloc: ,
                                        bloc: 
                                      ),
                                    );*/
                                  } else if (nombre == 'CREDITO') {
                                    /*InjectorContainer.getIt<AppRouter>().push(
                                      SavingAccountExtractDataTranRoute(
                                        sessionBloc: ,
                                        bloc: 
                                      ),
                                    );*/
                                  } else if (nombre == 'TARGETA DE CREDITO') {
                                    /*InjectorContainer.getIt<AppRouter>().push(
                                      SavingAccountExtractDataTranRoute(
                                        sessionBloc: ,
                                        bloc: 
                                      ),
                                    );*/
                                  }
                                },
                                child: SvgPicture.asset(
                                  icon,
                                  fit: BoxFit.fill,
                                  height: screenSize.height * 0.08,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$estado\n'
                                '$nombre',
                                style: AppTextStyles.mainStyleWhite12(context),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                '${data1.stateOperation}\n'
                                '${data1.operationCode}',
                                style: AppTextStyles.mainStyleWhite12(context),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CuentaConTipo<T> {
  final String tipo;
  final T data;

  CuentaConTipo({required this.tipo, required this.data});
}
