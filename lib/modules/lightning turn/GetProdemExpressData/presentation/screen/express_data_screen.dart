import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/lightning%20turn/GetProdemExpressData/presentation/bloc/express_data_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class ExpressDataScreen extends StatefulWidget {
  final ExpressDataBloc bloc;
  final SessionInfoBloc sessionBloc;
  const ExpressDataScreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
  });

  @override
  State<ExpressDataScreen> createState() => _ExpressDataScreenState();
}

class _ExpressDataScreenState extends State<ExpressDataScreen> {
  final TextEditingController amountToSendController = TextEditingController(
    text: '150',
  );
  final TextEditingController recipientAddressController =
      TextEditingController(text: '9151549');
  final TextEditingController recipientNameController = TextEditingController(
    text: 'Jade rashel piza quispe',
  );
  final TextEditingController recipientCellPhoneController =
      TextEditingController(text: '62537906');
  final TextEditingController reasonForSendingController =
      TextEditingController(text: 'pago');
  String? _selectedValue1;
  String? _selectedValueMoney;
  List<String> listMoney1 = ['BS', 'SUS'];
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
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
            'Giro relampago',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocBuilder<ExpressDataBloc, ExpressDataState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(topPadding * 0.05),
              child: Column(
                children: [
                  Text(
                    'GIRO RELAMPAGO:',
                    style: AppTextStyles.mainStyleGreen18Bold(context),
                  ),
                  BlocConsumer<SessionInfoBloc, SessionInfoState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is SessionInfoSuccess) {
                        final listAccounts = state
                            .userInfoResponseEnttity
                            .listCodeSavingsAccount;
                        final list = listAccounts
                            .map((account) => account.operationCode)
                            .toList();
                        return Column(
                          children: [
                            _buildDropdown(
                              title: 'CUENTA ORIGEN:',
                              items: list,
                              value: _selectedValue1,
                              onChanged: (newValue) {
                                setState(() => _selectedValue1 = newValue);
                              },
                              smallSpacing: smallSpacing,
                            ),
                            _buildDropdown(
                              title: 'MONEDA TRANSFERENCIA',
                              items: listMoney1,
                              value: _selectedValueMoney,
                              onChanged: (newValue) {
                                setState(() => _selectedValueMoney = newValue);
                              },
                              smallSpacing: smallSpacing,
                            ),
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: amountToSendController,
                    lbText: 'Momnto a enviar:',
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() => isChecked = value ?? false);
                        },
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
                    userController: recipientAddressController,
                    lbText: 'CI del DESTINATARIO :',
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: recipientNameController,
                    lbText: 'nombre del DESTINATARIO:',
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: recipientCellPhoneController,
                    lbText: 'celular DESTINATARIO:',
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: reasonForSendingController,
                    lbText: 'Motivo de envio:',
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() => isChecked = value ?? false);
                        },
                      ),
                      Text(
                        'Declaro conoser al destinatario del giro.',
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenSize.width * 0.3,
                    child: Card(
                      elevation: smallSpacing * 0.5,
                      child: Butoon1(
                        onTap: () {
                          //String codeSavingsAccount1 = '117-2-1-17515-8';
                          widget.bloc.add(
                            ExpressDEvent(
                              amountTransaction: amountToSendController.text,
                              benificiaryDi: recipientAddressController.text,
                              codeSavingAccountSource: _selectedValue1 ?? '',
                              idMoney: '1',
                            ),
                          );
                        },
                        lblTextField: 'Continuar',
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
