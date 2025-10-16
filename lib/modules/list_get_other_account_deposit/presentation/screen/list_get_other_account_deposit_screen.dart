import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/list_get_other_account_deposit/presentation/bloc/list_get_other_account_deposit_bloc.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ListGetOtherAccountDepositScreen extends StatelessWidget {
  const ListGetOtherAccountDepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<ListGetOtherAccountDepositBloc>()
            ..add(ListGetOtherAccountDeEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Solicitudes de Depósito desde otros bancos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              ListGetOtherAccountDepositBloc,
              ListGetOtherAccountDepositState
            >(
              builder: (context, state) {
                if (state is ListGetOtherAccountDepositSuccess) {
                  final res = state.listGetOtherAccountDepositResponseEntity;
                  return Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'Bandeja de solicitudes',
                          style: AppTextStyles.mainStyleGreen18Bold(context),
                        ),
                        SizedBox(height: smallSpacing * 0.5),
                        Expanded(
                          child: ListView.builder(
                            itemCount: res.length,
                            itemBuilder: (context, index) {
                              final data = res[index];
                              return Card(
                                elevation: smallSpacing * 0.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.green,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(topPadding * 0.05),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Id depósito:\n'
                                              'Cuenta destino\n'
                                              'Destino fondos\n'
                                              'Cuenta Origen\n'
                                              'Monto\n'
                                              'Estado',
                                              style:
                                                  AppTextStyles.mainStyleGreen12Bold(
                                                    context,
                                                  ),
                                            ),
                                            SizedBox(width: smallSpacing * 0.5),
                                            Text(
                                              '${data.idThirdOnlineDeposit}\n'
                                              '${data.thirdAccount}\n'
                                              '${data.destinationFunds}\n'
                                              '${data.accountFunds}\n'
                                              '${data.monto} ${data.codMoney}\n'
                                              '${data.state}',
                                              style:
                                                  AppTextStyles.mainStyleGreen12(
                                                    context,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Fecha:',
                                              style:
                                                  AppTextStyles.mainStyleGreen12Bold(
                                                    context,
                                                  ),
                                            ),
                                            SizedBox(width: smallSpacing * 0.5),
                                            Text(
                                              data.depositDate,
                                              style:
                                                  AppTextStyles.mainStyleGreen12(
                                                    context,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
      ),
    );
  }
}
