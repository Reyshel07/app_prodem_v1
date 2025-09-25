import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/presentation/bloc/get_ach_banck_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../utils/text.dart';

@RoutePage()
class GetAchBanckListScreen extends StatefulWidget {
  final GetAchBanckBloc bloc;
  final SessionInfoBloc sessionBloc;
  const GetAchBanckListScreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
  });

  @override
  State<GetAchBanckListScreen> createState() => _GetAchBanckListScreenState();
}

class _GetAchBanckListScreenState extends State<GetAchBanckListScreen> {
  final TextEditingController amountToSendController = TextEditingController(
    text: '117',
  );
  final TextEditingController recipientsAccountController =
      TextEditingController();
  final TextEditingController destinationAccountController =
      TextEditingController();
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController reasonForTransferController =
      TextEditingController();
  String? _selectedValue;
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
            'Transferencia a otros bancos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(topPadding * 0.05),
              child: Column(
                children: [
                  Text(
                    'TRANSFERENCIA A OTROS BANCOS:',
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
                            TextFromFiel02(
                              screenSize: screenSize,
                              smallSpacing: smallSpacing,
                              userController: amountToSendController,
                              lbText: 'Monto a enviar:',
                            ),
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    },
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
                  BlocBuilder<GetAchBanckBloc, GetAchBanckState>(
                    builder: (context, state) {
                      if (state is GetAchBanckSuccess) {
                        final res = state.getAchBanksListResponseEntity;
                        final nameList = res.data.colBanks
                            .map((account) => account.bank)
                            .toList(); //listAccounts.map((account) => account.operationCode).toList();
                        return _buildDropdown(
                          title: 'Banco DESTINO',
                          items: nameList,
                          value: _selectedValue,
                          onChanged: (newValue) {
                            setState(() => _selectedValue = newValue);
                          },
                          smallSpacing: smallSpacing,
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: recipientsAccountController,
                    lbText: 'Cuenta del DESTINATARIO(Banco Destino):',
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: destinationAccountController,
                    lbText: 'Nombre del DESTINATARIO:',
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: recipientController,
                    lbText: 'Nro. Doc/NIT destinatario:',
                  ),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: reasonForTransferController,
                    lbText: 'Motivo de la transferencia:',
                  ),
                  Text(
                    'Los datos que se validarán para procesar la transferencia de fondos son el numero de cuenta el beneficiario y el nombre de la Entidad Financiera Destinataria, por lo que es responsabilidad del ordenante verificar dicho datos.',
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.mainStyleRed10Bold(context),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.4,
                    child: Card(
                      elevation: smallSpacing * 0.5,
                      child: Butoon1(onTap: () {}, lblTextField: 'CONTINUAR'),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
