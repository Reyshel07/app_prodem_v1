import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';

@RoutePage()
class DecryptQrScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  final DecryptQrStringEntity decryptQrStringEntity;
  final String stringQr;
  const DecryptQrScreen({
    super.key,
    required this.decryptQrStringEntity,
    required this.sessionBloc,
    required this.stringQr,
  });

  @override
  State<DecryptQrScreen> createState() => _DecryptQrScreenState();
}

class _DecryptQrScreenState extends State<DecryptQrScreen> {
  String? _selectedAccount;
  String? _selectedAccountId;
  String? _selectedAccountMoneyId;
  String? balance;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: widget.sessionBloc)],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Pago QR Prodem',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Text(
                'PAGO DE QR:',
                style: AppTextStyles.mainStyleGreen18Bold(context),
                textAlign: TextAlign.center,
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: TextEditingController(
                  text: widget.decryptQrStringEntity.receiverName,
                ),
                lbText: 'Destinatario:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: TextEditingController(
                  text: widget.decryptQrStringEntity.amount.toString(),
                ),
                lbText: 'Monto a pagar:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: TextEditingController(
                  text: widget.decryptQrStringEntity.reference,
                ),
                lbText: 'Referencia:',
              ),
              AccountDropdown(
                selectedAccount: _selectedAccount,
                smallSpacing: smallSpacing,
                screenSize: screenSize,
                onAccountSelected: (account) {
                  setState(() {
                    _selectedAccount = account.operationCode;
                    _selectedAccountId = account.idOperationEntity;
                    _selectedAccountMoneyId = account.idMoney;
                    balance = account.balance;
                  });
                },
              ),
              Butoon1(
                onTap: () {
                  InjectorContainer.getIt<AppRouter>().push(
                    DecryptQrDetailsRoute(
                      cuenta: _selectedAccount ?? '',
                      monto: widget.decryptQrStringEntity.amount.toString(),
                      cambioMoneda: 'NO',
                      saldo: balance ?? '',
                      decryptQrStringEntity: widget.decryptQrStringEntity,
                      stringQr: widget.stringQr,
                    ),
                  );
                },
                lblTextField: 'CONTINUAR',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
