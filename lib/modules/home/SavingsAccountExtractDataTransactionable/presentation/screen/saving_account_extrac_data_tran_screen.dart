import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/utils/time.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/SavingsAccountExtractDataTransactionable/presentation/bloc/saving_account_extrac_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/router.dart';
import '../../../../../presentation/widget/butoons_widget.dart';
import '../../../../../utils/text_util.dart';

@RoutePage()
class SavingAccountExtractDataTranSacreen extends StatefulWidget {
  const SavingAccountExtractDataTranSacreen({super.key});

  @override
  State<SavingAccountExtractDataTranSacreen> createState() =>
      _SavingAccountExtractDataTranSacreenState();
}

class _SavingAccountExtractDataTranSacreenState
    extends State<SavingAccountExtractDataTranSacreen> {
  String? _selectedValue;

  final List<String> _options = [
    "Opción 1",
    "Opción 2",
    "Opción 3",
    "Opción 4",
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) => InjectorContainer.getIt<SavingAccountExtracBloc>(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Últimos movimientos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocBuilder<SavingAccountExtracBloc, SavingAccountExtracState>(
          builder: (context, state) {
            if (state is SavingAccountExtracSuccess) {
              final res = state.dataSavingAccountExtracEntity;
              return Padding(
                padding: EdgeInsets.all(topPadding * 0.05),
                child: Column(
                  children: [
                    Text(
                      'CONSULTA DE SALDOS DE CUENTAS DE AHORRO',
                      style: AppTextStyles.mainStyleGreen18Bold(context),
                    ),
                    SizedBox(height: smallSpacing * 0.5),
                    Card(
                      elevation: smallSpacing * 0.5,
                      child: SizedBox(
                        width: double.infinity,
                        child: DropdownButton<String>(
                          padding: EdgeInsetsGeometry.all(topPadding * 0.05),
                          hint: const Text("Seleccione una opción"),
                          value: _selectedValue,
                          items: _options.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.3,
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Butoon1(
                          onTap: () {
                            String codeSavingsAccount1 = '117-2-2-04443-0';
                            context.read<SavingAccountExtracBloc>().add(
                              SavingAccountExEnevet(
                                codeSavingsAccount: codeSavingsAccount1,
                              ),
                            );
                          },
                          lblTextField: 'CONSULTAR',
                        ),
                      ),
                    ),
                    SizedBox(height: smallSpacing * 0.5),
                    Text(
                      'ULTIMOS MOVIMIENTOS:',
                      style: AppTextStyles.mainStyleGreen18Bold(context),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.3,
                          child: Text(
                            'Fecha: \nNro. de cuenta:\n Saldo:',
                            textAlign: TextAlign.start,
                            style: AppTextStyles.mainStyleGreen14Bold(context),
                          ),
                        ),
                        Text(
                          '${res.processDate}\n'
                          '${res.codeSavingsAccount}\n'
                          '${res.accountBalance}',
                          textAlign: TextAlign.start,
                          style: AppTextStyles.mainStyleGreen14(context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.45,
                      child: ListView.builder(
                        itemCount: res.colDetailsMovemment.length,
                        itemBuilder: (BuildContext context, int index) {
                          final colDetailsM = res.colDetailsMovemment[index];
                          final date = DateTime.parse(
                            colDetailsM.dateTransaction.toString(),
                          );
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Detalle del Movimiento',
                                      style: AppTextStyles.mainStyleGreen18Bold(
                                        context,
                                      ),
                                    ),
                                    content: SizedBox(
                                      height: screenSize.height * 0.2,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: screenSize.width * 0.23,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Fecha/Hora:\nTransaccion:\nAgencia:\nMonto:\nSaldo:',
                                                  style:
                                                      AppTextStyles.mainStyleGreen12Bold(
                                                        context,
                                                      ),
                                                ),
                                                Text(
                                                  'Referencia:',
                                                  style:
                                                      AppTextStyles.mainStyleGreen12Bold(
                                                        context,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: screenSize.width * 0.35,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${DateFormatter.formatDateTime(date)}\n'
                                                  '${colDetailsM.descriptionOperation}\n'
                                                  '${colDetailsM.officeTransaction}\n'
                                                  '${colDetailsM.amountBalance}\n'
                                                  '${colDetailsM.deposit}',
                                                  style:
                                                      AppTextStyles.mainStyleGreen12(
                                                        context,
                                                      ),
                                                ),
                                                Text(
                                                  colDetailsM.reference,
                                                  style:
                                                      AppTextStyles.mainStyleGreen12(
                                                        context,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Card(
                              elevation: smallSpacing * 0.45,
                              child: Padding(
                                padding: EdgeInsets.all(topPadding * 0.05),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenSize.width * 0.65,
                                      child: Text(
                                        '${colDetailsM.dateTransaction}\n'
                                        '${colDetailsM.reference}',
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.mainStyle12(
                                          context,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${colDetailsM.deposit}\n'
                                      '${colDetailsM.officeTransaction}',
                                      textAlign: TextAlign.end,
                                      style: AppTextStyles.mainStyle12(context),
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
            return Column(
              children: [
                Text(
                  'CONSULTA DE SALDOS DE CUENTAS DE AHORRO',
                  style: AppTextStyles.mainStyleGreen18Bold(context),
                ),
                SizedBox(height: smallSpacing * 0.5),
                Card(
                  elevation: smallSpacing * 0.5,
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      padding: EdgeInsetsGeometry.all(topPadding * 0.05),
                      hint: const Text("Seleccione una opción"),
                      value: _selectedValue,
                      items: _options.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.3,
                  child: Card(
                    elevation: smallSpacing * 0.5,
                    child: Butoon1(
                      onTap: () {
                        String codeSavingsAccount1 = '117-2-2-04443-0';
                        context.read<SavingAccountExtracBloc>().add(
                          SavingAccountExEnevet(
                            codeSavingsAccount: codeSavingsAccount1,
                          ),
                        );
                      },
                      lblTextField: 'CONSULTAR',
                    ),
                  ),
                ),
              ],
            );
            ;
          },
        ),
      ),
    );
  }
}
