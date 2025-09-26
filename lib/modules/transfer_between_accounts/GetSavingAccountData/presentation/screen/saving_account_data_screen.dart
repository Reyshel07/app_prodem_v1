import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/bloc/saving_account_data_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../../config/router/router.dart';
import '../../../../../utils/text.dart';
import '../../../../home/UserSessionInfo/presentation/bloc/bloc.dart';

enum TransferType {
  ownAccounts, // transferencia entre cuentas propias
  thirdParty, // transferencia a terceros
}

@RoutePage()
class TransferScreen extends StatefulWidget {
  final SavingAccountDataBloc bloc;
  final SessionInfoBloc sessionBloc;
  final TransferType transferType;

  const TransferScreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
    required this.transferType,
  });

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController transactionAmountController =
      TextEditingController(text: '45');
  final TextEditingController observationController = TextEditingController(
    text: 'deposito',
  );
  final TextEditingController destinationAccountController =
      TextEditingController(text: '117-2-1-17513-0');

  String? _selectedValue;
  String? _codeSavingAccountSource;
  String? _codeSavingAccount;
  bool isChecked = false;

  List<String> listMoney1 = ['BS', 'SUS'];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    final isOwnAccounts = widget.transferType == TransferType.ownAccounts;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.bloc),
        BlocProvider.value(value: widget.sessionBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            isOwnAccounts
                ? 'Transferencia entre cuentas propias'
                : 'Transferencia a Cuentas de Terceros',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocBuilder<SessionInfoBloc, SessionInfoState>(
          builder: (context, state) {
            if (state is SessionInfoSuccess) {
              final listAccounts =
                  state.userInfoResponseEnttity.listCodeSavingsAccount;
              final list = listAccounts
                  .map((account) => account.operationCode)
                  .toList();

              return Padding(
                padding: EdgeInsets.all(topPadding * 0.05),
                child: Column(
                  children: [
                    Text(
                      isOwnAccounts
                          ? 'TRANSFERENCIA ENTRE CUENTAS PROPIAS:'
                          : 'TRANSFERENCIA A TERCEROS:',
                      style: AppTextStyles.mainStyleGreen16Bold(context),
                    ),
                    // CUENTA ORIGEN
                    _buildDropdown(
                      title: 'CUENTA AHORRO ORIGEN',
                      items: list,
                      value: _codeSavingAccountSource,
                      onChanged: (newValue) {
                        setState(() => _codeSavingAccountSource = newValue);
                      },
                      smallSpacing: smallSpacing,
                    ),
                    // MONEDA
                    _buildDropdown(
                      title: 'MONEDA TRANSFERENCIA',
                      items: listMoney1,
                      value: _selectedValue,
                      onChanged: (newValue) {
                        setState(() => _selectedValue = newValue);
                      },
                      smallSpacing: smallSpacing,
                    ),
                    // Si es a terceros, mostrar checkbox de favoritos
                    if (!isOwnAccounts)
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() => isChecked = value ?? false);
                            },
                          ),
                          Text('Elegir de mis cuentas favoritas'),
                        ],
                      ),
                    // MONTO
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: transactionAmountController,
                      lbText: 'MONTO TRANSACCION',
                    ),
                    // Destino (propias o terceros)
                    if (isOwnAccounts)
                      _buildDropdown(
                        title: 'CUENTA AHORRO DESTINO',
                        items: list,
                        value: _codeSavingAccount,
                        onChanged: (newValue) {
                          setState(() => _codeSavingAccount = newValue);
                        },
                        smallSpacing: smallSpacing,
                      )
                    else
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: destinationAccountController,
                        lbText: 'Cuenta AHORRO DESTINO',
                      ),
                    // OBSERVACIÓN
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: observationController,
                      lbText: 'DIGITE ALGUNA OBSERVACIÓN',
                    ),
                    if (!isOwnAccounts)
                      Padding(
                        padding: EdgeInsets.only(top: smallSpacing * 0.5),
                        child: Text(
                          'Los datos que se validarán para procesar la transferencia son el número de cuenta del beneficiario y el nombre de la Entidad Financiera Destinataria. Verifíquelos antes de continuar.',
                          style: AppTextStyles.mainStyleRed10Bold(context),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    SizedBox(height: smallSpacing),
                    // BOTÓN CONTINUAR
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child:
                            BlocConsumer<
                              SavingAccountDataBloc,
                              SavingAccountDataState
                            >(
                              listener: (context, state) {
                                if (state is SavingAccountDataSuccess) {
                                  final res = state.dataSavingAccountEntity;
                                  InjectorContainer.getIt<AppRouter>().push(
                                    TransferFeesTwoRoute(
                                      cuentaD: isOwnAccounts
                                          ? _codeSavingAccountSource ?? ''
                                          : destinationAccountController.text,
                                      cuentaO: isOwnAccounts
                                          ? _codeSavingAccount ?? ''
                                          : _codeSavingAccountSource ?? '',
                                      monto: transactionAmountController.text,
                                      titulares: res.colHolders.toList(),
                                      saldo: res.savingBalance.toString(),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                return Butoon1(
                                  onTap: () {
                                    widget.bloc.add(
                                      SavingAccountDEvent(
                                        codeSavingAccountSource:
                                            _codeSavingAccountSource ?? '',
                                        codeSavingAccount: isOwnAccounts
                                            ? _codeSavingAccount ?? ''
                                            : destinationAccountController.text,
                                        amountOperation:
                                            transactionAmountController.text,
                                        idMoneyOperation: 1,
                                      ),
                                    );
                                  },
                                  lblTextField: 'CONTINUAR',
                                );
                              },
                            ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String title,
    required List<String> items,
    required String? value,
    required void Function(String?) onChanged,
    required double smallSpacing,
  }) {
    return SizedBox(
      child: Card(
        elevation: smallSpacing * 0.5,
        child: Container(
          width: double.infinity,
          height: smallSpacing * 3,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.green),
            borderRadius: BorderRadius.all(radiusCircular(11)),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            padding: EdgeInsetsGeometry.all(smallSpacing * 0.5),
            hint: Text(
              title,
              style: AppTextStyles.mainStyleGreen14Bold(context),
            ),
            value: value,
            items: items
                .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
