import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/transfer%20between%20accounts/GetSavingAccountData/presentation/bloc/saving_account_data_bloc.dart';
import 'package:app_prodem_v1/presentation/screen/Register/account_settings_screen.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/router/router.dart';
import '../../../../../utils/text.dart';

@RoutePage()
class SavingAccountDataScreen extends StatefulWidget {
  const SavingAccountDataScreen({super.key});

  @override
  State<SavingAccountDataScreen> createState() =>
      _SavingAccountDataScreenState();
}

class _SavingAccountDataScreenState extends State<SavingAccountDataScreen> {
  final TextEditingController transactionAmountController =
      TextEditingController();
  final TextEditingController observationController = TextEditingController(
    text: 'deposito',
  );
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) => InjectorContainer.getIt<SavingAccountDataBloc>(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Transferencia entre cuentas propias',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocBuilder<SavingAccountDataBloc, SavingAccountDataState>(
          builder: (context, state) {
            if (state is SavingAccountDataSuccess) {
              return Column();
            }
            return Padding(
              padding: EdgeInsets.all(topPadding * 0.05),
              child: Column(
                children: [
                  Text(
                    'TRANSFERENCIA ENTRE CUENTAS PROPIAS:',
                    style: AppTextStyles.mainStyleGreen16Bold(context),
                  ),
                  DrowpButoon2(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                  ),
                  DrowpButoon2(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: transactionAmountController,
                    lbText: 'Monto de transacción',
                  ),
                  DrowpButoon2(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: observationController,
                    lbText: 'Digite alguna observación',
                  ),
                  SizedBox(
                    width: screenSize.width * 0.4,
                    child: Card(
                      elevation: smallSpacing * 0.5,
                      child: Butoon1(
                        onTap: () {
                          String codeSavingAccountSource = '117-2-1-17512-5';
                          String codeSavingAccount = '117-2-1-17513-0';
                          int idMoneyOperation = 1;
                          String amountOperation = "56";
                          context.read<SavingAccountDataBloc>().add(
                            SavingAccountDEvent(
                              codeSavingAccountSource: codeSavingAccountSource,
                              codeSavingAccount: codeSavingAccount,
                              amountOperation: amountOperation,
                              idMoneyOperation: idMoneyOperation,
                            ),
                          );
                        },
                        lblTextField: 'CONTINUAR',
                      ),
                    ),
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
