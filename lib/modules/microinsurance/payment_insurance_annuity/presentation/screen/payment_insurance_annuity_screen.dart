import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/modules/microinsurance/insurance_get_list/domain/entities/insurance_get_list_entity.dart';
import 'package:app_prodem_v1/modules/microinsurance/payment_insurance_annuity/presentation/bloc/payment_insurance_annuity_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/prodem_key.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PaymentInsuranceAnnuityScreen extends StatefulWidget {
  final InsuranceGetListEntity data;
  const PaymentInsuranceAnnuityScreen({super.key, required this.data});

  @override
  State<PaymentInsuranceAnnuityScreen> createState() =>
      _PaymentInsuranceAnnuityScreenState();
}

class _PaymentInsuranceAnnuityScreenState
    extends State<PaymentInsuranceAnnuityScreen> {
  String? _selectedAccount;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<PaymentInsuranceAnnuityBloc>(),
        ),
        BlocProvider(
          create: (context) => InjectorContainer.getIt<CreatePrKeyBloc>(),
        ),
        BlocProvider(
          create: (contex) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
        ),
        BlocProvider(
          create: (contex) => InjectorContainer.getIt<SessionInfoBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Pago Seguro de Terceros',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Text(
                'PAGO DE SEGURO DE TERCEROS:',
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              //help
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Número de Póliza:\n'
                    'Monto:\n'
                    'Asegurado:',
                    style: AppTextStyles.mainStyleGreen14Bold(context),
                  ),
                  SizedBox(width: smallSpacing * 0.5),
                  SizedBox(
                    width: screenSize.width * 0.6,
                    child: Text(
                      '${widget.data.nroCertificado}\n'
                      '${widget.data.montoTransaccion}\n'
                      '${widget.data.asegurado}',
                      style: AppTextStyles.mainStyleGreen14(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: smallSpacing * 0.5),
              BlocConsumer<
                PaymentInsuranceAnnuityBloc,
                PaymentInsuranceAnnuityState
              >(
                listener: (context, state) {
                  if (state is PaymentInsuranceAnnuitySuccess) {
                    InjectorContainer.getIt<AppRouter>().push(
                      SavingAccountTransMobileEndRoute(
                        response:
                            state.paymentInsuranceAnnuityResponseEntity.data,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ProdemKeySection(
                    smallSpacing: smallSpacing,
                    screenSize: screenSize,
                    onConfirm: () {
                      final createState = context.read<CreatePrKeyBloc>().state;

                      if (createState is CreatePrKeySuccess) {
                        final idSms = createState
                            .createProdemKeyResponseEntity
                            .data
                            .toString();
                        context.read<PaymentInsuranceAnnuityBloc>().add(
                          PaymentInsuAnnuEvent(
                            idInsuranceAnnuity: widget.data.idInsuranceAnnuity
                                .toString(),

                            idSMSOperation: idSms,
                            idSavingAccount: '17151629734483090',
                            isOwnInsurance: false,
                            prodemKeyCode:
                                context.read<GetPrKeyByIdBloc>().state
                                    is GetPrKeyByIdSuccess
                                ? (context.read<GetPrKeyByIdBloc>().state
                                              as GetPrKeyByIdSuccess)
                                          .getProdemKeyByIdResponseEntity
                                          ?.data ??
                                      ''
                                : '',
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
