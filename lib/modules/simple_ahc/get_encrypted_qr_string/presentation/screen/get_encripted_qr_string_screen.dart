import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/presentation/bloc/get_encripted_qr_string_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class GetEncriptedQrStringScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  const GetEncriptedQrStringScreen({super.key, required this.sessionBloc});

  @override
  State<GetEncriptedQrStringScreen> createState() =>
      _GetEncriptedQrStringScreenState();
}

class _GetEncriptedQrStringScreenState
    extends State<GetEncriptedQrStringScreen> {
  final TextEditingController amountController = TextEditingController(
    text: '45',
  );
  final TextEditingController referenceController = TextEditingController(
    text: 'gastos',
  );
  String? _codeSavingAccountSource;
  String? _deadline;
  String? _money;
  bool isChecked = false;

  String? _selectedAccount;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.sessionBloc),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<GetEncriptedQrStringBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Cobro QR PRODEM',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Text(
                'COBRO MEDIANTE CÓDIGO QR:',
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              BlocConsumer<SessionInfoBloc, SessionInfoState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is SessionInfoSuccess) {
                    final res = state.userInfoResponseEnttity;
                    return Column(
                      children: [
                        AccountDropdown(
                          selectedAccount: _selectedAccount,
                          smallSpacing: smallSpacing,
                          screenSize: screenSize,
                          onAccountSelected: (account) {
                            setState(() {
                              _selectedAccount = account.operationCode;
                            });
                          },
                        ),
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: amountController,
                          lbText: 'MONTO',
                        ),
                        _buildDropdown(
                          title: 'Moneda',
                          items: [],
                          value: _money,
                          onChanged: (newValue) {
                            setState(() => _codeSavingAccountSource = newValue);
                          },
                          smallSpacing: smallSpacing,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() => isChecked = value ?? false);
                              },
                            ),
                            Text('¿Un único uso?'),
                          ],
                        ),
                        _buildDropdown(
                          title: 'plazo:',
                          items: [],
                          value: _deadline,
                          onChanged: (newValue) {
                            setState(() => _codeSavingAccountSource = newValue);
                          },
                          smallSpacing: smallSpacing,
                        ),
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: referenceController,
                          lbText: 'Referencia',
                        ),
                        BlocBuilder<
                          GetEncriptedQrStringBloc,
                          GetEncriptedQrStringState
                        >(
                          builder: (context, state) {
                            if (state is GetEncriptedQrStringSuccess) {
                              InjectorContainer.getIt<AppRouter>().push(
                                EncriptedQRRoute(
                                  getEncryptedQrStringEntity:
                                      state.getEncryptedQrStringEntity,
                                  moneda: 'Bs',
                                  monto: amountController.text,
                                  referencia: referenceController.text,
                                  nombre: res.personName ?? '',
                                  cuenta: _selectedAccount ?? '',
                                  valido: '12/03/2025',
                                ),
                              );
                            }
                            return ElevateButton1(
                              onTap: () {
                                context.read<GetEncriptedQrStringBloc>().add(
                                  GetEncriptedQrSEvent(
                                    accountCode: _selectedAccount ?? '',
                                    moneyCode: 'BOB',
                                    amount: amountController.text,
                                    isUniqueUse: isChecked,
                                    expiredOption: '365',
                                    reference: referenceController.text,
                                  ),
                                );
                              },
                              lblTextField: 'GENERAR QR',
                            );
                          },
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
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
