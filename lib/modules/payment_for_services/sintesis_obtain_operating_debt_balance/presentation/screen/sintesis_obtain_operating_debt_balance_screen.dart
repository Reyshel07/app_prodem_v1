import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/entity.dart';

@RoutePage()
class SintesisObtainOperatingDebtBalanceScreen extends StatelessWidget {
  final String name;
  final List<ColAccountEntity> colAccount;
  const SintesisObtainOperatingDebtBalanceScreen({
    super.key,
    required this.name,
    required this.colAccount,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.white,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text(name, style: AppTextStyles.mainStyleWhite18Bold(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Column(
          children: [
            Text(
              'Seleccione la cuenta que desea consultar',
              style: AppTextStyles.mainStyleGreen14Bold(context),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: colAccount.length,
              itemBuilder: (context, index) {
                final res = colAccount[index];
                return Column(
                  children: [
                    Card(
                      elevation: smallSpacing * 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.green,
                          ),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(topPadding * 0.05),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Código:\n'
                                'Servicio:\n'
                                'Nombre:',
                                style: AppTextStyles.mainStyleGreen14Bold(
                                  context,
                                ),
                              ),
                              SizedBox(width: smallSpacing * 0.5),
                              SizedBox(
                                width: screenSize.width * 0.5,
                                child: Text(
                                  '${res.accountCode}\n'
                                  '${res.serviceDescription}\n'
                                  '${res.customerName}',
                                  style: AppTextStyles.mainStyleGreen14(
                                    context,
                                  ),
                                ),
                              ),

                              Column(
                                children: [
                                  SizedBox(height: screenSize.height * 0.025),
                                  IconButton(
                                    onPressed: () {
                                      InjectorContainer.getIt<AppRouter>().push(
                                        SintesisObtainOperatingDebtBalanceTwoRoute(
                                          colAccountItemDetail:
                                              res.colAccountItemDetail,
                                          codigoCuenta: res.accountCode,
                                          nombre: res.customerName,
                                          saldo: res.additionalInfo,
                                          name: name,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
