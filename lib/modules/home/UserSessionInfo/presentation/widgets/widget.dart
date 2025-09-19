import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';

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
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.green,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
  final List<CuentaConTipo<ListCodeResponseEntity>> todasList;
  final double smallSpacing;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.18,
      width: screenSize.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: todasList.length,
        itemBuilder: (BuildContext context, int index) {
          final account = todasList[index];
          final tipo = account.tipo;
          final data1 = account.data;
          String nombre;
          String imagen;
          switch (tipo) {
            case "cuenta":
              nombre = "CUENTA DE AHORRO:";
              imagen = "assets/img/fondoverde1.png";
              break;
            case "credito":
              nombre = "CREDITO:";
              imagen = "assets/img/fondonegro1.png";
              break;
            case "targeta":
            default:
              nombre = "TARGETA DE CREDITO:";
              imagen = "assets/img/fondonegro1.png";
              break;
          }
          return SizedBox(
            height: screenSize.height * 0.18,
            width: screenSize.width * 0.95,
            child: Card(
              margin: EdgeInsetsDirectional.all(8),
              elevation: smallSpacing * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(imagen, fit: BoxFit.cover),
                    Padding(
                      padding: EdgeInsets.all(topPadding * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SALDO',
                                textAlign: TextAlign.start,
                                style: AppTextStyles.mainStyleWhite14Bold(
                                  context,
                                ),
                              ),
                              Text(
                                '${data1.availableAmount} ${data1.codMoney}',
                                style: AppTextStyles.mainStyleWhite25Bold(
                                  context,
                                ),
                              ),
                              Text(
                                'ESTADO\n'
                                '$nombre',
                                style: AppTextStyles.mainStyleWhite14Bold(
                                  context,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\n'
                                '\n\n'
                                'ACTIVO\n'
                                '${data1.operationCode}',
                                style: AppTextStyles.mainStyleWhite14Bold(
                                  context,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.sticky_note_2_outlined,
                                color: Theme.of(context).colorScheme.white,
                              ),
                              SizedBox(height: smallSpacing * 0.8),
                              Icon(
                                Icons.remove_red_eye,
                                color: Theme.of(context).colorScheme.white,
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
