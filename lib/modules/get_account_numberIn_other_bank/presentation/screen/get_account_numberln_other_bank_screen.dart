import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class AccountNumberlnOtherBankScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  const AccountNumberlnOtherBankScreen({super.key, required this.sessionBloc});

  @override
  State<AccountNumberlnOtherBankScreen> createState() =>
      _AccountNumberlnOtherBankScreenState();
}

class _AccountNumberlnOtherBankScreenState
    extends State<AccountNumberlnOtherBankScreen> {
  final TextEditingController nameOfTheDepositorController =
      TextEditingController(text: 'jade rashel piza quispe');
  final TextEditingController amountController = TextEditingController(
    text: '145',
  );
  final TextEditingController acountOriController = TextEditingController(
    text: '62537906',
  );

  bool isChecked = false;
  String? _selectedValue1;
  String? _selectedValue2;
  String? _selectedValue3;
  DateTime? _fechaSeleccionada;

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? fechaElegida = await showDatePicker(
      context: context,
      initialDate: _fechaSeleccionada ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('es', ''),
    );

    if (fechaElegida != null && fechaElegida != _fechaSeleccionada) {
      setState(() {
        _fechaSeleccionada = fechaElegida;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;

    final fechaTexto = _fechaSeleccionada != null
        ? DateFormat('dd/MM/yyyy').format(_fechaSeleccionada!)
        : 'dd/mm/aaaa';

    return MultiBlocProvider(
      providers: [BlocProvider.value(value: widget.sessionBloc)],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Nuevo Depósito desde otras Entidades',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocConsumer<SessionInfoBloc, SessionInfoState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SessionInfoSuccess) {
              final res = state.userInfoResponseEnttity;
              final listAccounts = res.listCodeSavingsAccount;
              final list = listAccounts
                  .map((account) => account.operationCode)
                  .toList();
              final cuentaOri = res.listLipBank
                  .map((ori1) => ori1.nombre)
                  .toList();
              final oriFondos = res.listOriginFund
                  .map((ori) => ori.nombre)
                  .toList();

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Datos del depósito realizado al QR',
                      style: AppTextStyles.mainStyleGreen18Bold(context),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) =>
                              setState(() => isChecked = value ?? false),
                        ),
                        Text(
                          'Elegir de mis cuentas favoritas',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                      ],
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: nameOfTheDepositorController,
                      lbText: 'Nombre del Depositante:',
                    ),
                    _buildDropdown(
                      title: 'Banco origen de los fondos:',
                      items: cuentaOri,
                      value: _selectedValue1,
                      onChanged: (newValue) {
                        setState(() => _selectedValue1 = newValue);
                      },
                      smallSpacing: smallSpacing,
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: acountOriController,
                      lbText: 'Cuenta origen:',
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: amountController,
                      lbText: 'Monto:',
                    ),
                    SizedBox(height: smallSpacing * 0.5),
                    Card(
                      elevation: smallSpacing * 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.green,
                          ),
                          borderRadius: BorderRadius.all(radiusCircular(11)),
                        ),
                        child: TextFormField(
                          controller: TextEditingController(text: fechaTexto),
                          readOnly: true,
                          onTap: () => _seleccionarFecha(context),
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
                            hintText: 'Fecha de depósito;',
                            hintStyle: AppTextStyles.mainStyleGreen14(context),
                            filled: false,
                            isDense: false,
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Datos de la cuenta a depositar en PRODEM',
                      style: AppTextStyles.mainStyleGreen14Bold(context),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) =>
                              setState(() => isChecked = value ?? false),
                        ),
                        Text(
                          '¿Es a cuenta propia?',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                      ],
                    ),
                    _buildDropdown(
                      title: 'Cuentas propias:',
                      items: list,
                      value: _selectedValue2,
                      onChanged: (newValue) {
                        setState(() => _selectedValue2 = newValue);
                      },
                      smallSpacing: smallSpacing,
                    ),
                    _buildDropdown(
                      title: 'Origen de los fondos::',
                      items: oriFondos,
                      value: _selectedValue3,
                      onChanged: (newValue) {
                        setState(() => _selectedValue3 = newValue);
                      },
                      smallSpacing: smallSpacing,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Butoon1(
                        onTap: () {
                          InjectorContainer.getIt<AppRouter>().push(
                            CurrentQrByTypeTwoRoute(
                              nameDepo: nameOfTheDepositorController.text,
                              bancoOri: _selectedValue1.toString(),
                              cuenta: _selectedValue2.toString(),
                              cuentaOri: acountOriController.text,
                              cuentaPro: 'SI',
                              desFon: 'h',
                              fechaDepo: fechaTexto,
                              moneda: 'BS',
                              monto: amountController.text,
                              oriFon: _selectedValue3.toString(),
                            ),
                          );
                        },
                        lblTextField: 'CONTINUAR',
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is SessionInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Center(child: Text('Cargando información...'));
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
            borderRadius: const BorderRadius.all(Radius.circular(11)),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            padding: EdgeInsets.all(smallSpacing * 0.5),
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
