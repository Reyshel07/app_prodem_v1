import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../domain/entities/entity.dart';

@RoutePage()
class DecryptQrScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  final DecryptQrStringEntity decryptQrStringEntity;
  const DecryptQrScreen({
    super.key,
    required this.decryptQrStringEntity,
    required this.sessionBloc,
  });

  @override
  State<DecryptQrScreen> createState() => _DecryptQrScreenState();
}

class _DecryptQrScreenState extends State<DecryptQrScreen> {
  String? _codeSavingAccountSource;
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
              BlocConsumer<SessionInfoBloc, SessionInfoState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is SessionInfoSuccess) {
                    final listAccounts =
                        state.userInfoResponseEnttity.listCodeSavingsAccount;
                    final list = listAccounts
                        .map((account) => account.operationCode)
                        .toList();
                    return _buildDropdown(
                      title: 'CUENTA AHORRO ORIGEN',
                      items: list,
                      value: _codeSavingAccountSource,
                      onChanged: (newValue) {
                        setState(() => _codeSavingAccountSource = newValue);
                      },
                      smallSpacing: smallSpacing,
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
              Butoon1(
                onTap: () {
                  InjectorContainer.getIt<AppRouter>().push(
                    DecryptQrDetailsRoute(
                      cuenta: _codeSavingAccountSource ?? '',
                      monto: widget.decryptQrStringEntity.amount.toString(),
                      cambioMoneda: 'NO',
                      saldo: '10100',
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
