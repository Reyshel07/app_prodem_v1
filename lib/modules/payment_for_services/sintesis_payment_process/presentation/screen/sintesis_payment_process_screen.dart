import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_payment_process/presentation/bloc/sintesis_payment_process_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/prodem_key.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SintesisPaymentProcessScreen extends StatefulWidget {
  final String name;
  const SintesisPaymentProcessScreen({super.key, required this.name});

  @override
  State<SintesisPaymentProcessScreen> createState() =>
      _SintesisPaymentProcessScreenState();
}

class _SintesisPaymentProcessScreenState
    extends State<SintesisPaymentProcessScreen> {
  final TextEditingController nitController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  final TextEditingController nameFacController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountTotalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<SintesisPaymentProcessBloc>(),
        ),
        BlocProvider(
          create: (context) => InjectorContainer.getIt<CreatePrKeyBloc>(),
        ),
        BlocProvider(
          create: (contex) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            widget.name,
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Código cuenta:\n'
                    'Nombre cuenta:',
                  ),
                  Text(
                    'Código cuenta:\n'
                    'Nombre:',
                  ),
                ],
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: nitController,
                lbText: 'Número de NIT:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: complementoController,
                lbText: 'Complento CI:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: nameFacController,
                lbText: 'Nombre de la factura:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: emailController,
                lbText: 'Correo electrónico:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: phoneController,
                lbText: 'Télefono/Celular ${widget.name}:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: amountTotalController,
                lbText: 'Total a pagar:',
              ),
              BlocConsumer<
                SintesisPaymentProcessBloc,
                SintesisPaymentProcessState
              >(
                listener: (context, state) {
                  if (state is SintesisPaymentProcessSuccess) {
                    InjectorContainer.getIt<AppRouter>().push(
                      SavingAccountTransMobileEndRoute(
                        response: state
                            .sintesisPaymentProcessResponseEntity
                            .data
                            .reportString,
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
                        context.read<SintesisPaymentProcessBloc>().add(
                          SintesisPaymentProEvent(
                            idUser: "4",
                            idOffice: "1",
                            idCustomer: "0",
                            invoiceNIT: "3477322",
                            invoiceName: "ASTETE",
                            invoiceCustomerEmail: "NO TIENE",
                            invoiceDocumentType: "1",
                            invoiceDocumentComplement: "",
                            invoicePhone: "73074904",
                            idExternalSystem: "8",
                            searchData: "71249026",
                            idMoney: '1',
                            mFServiceCode: "SINTESIS 8",
                            externalSystemPaymentID: "0",
                            totalToPay: "10.0",
                            isMobile: true,
                            idSavingAccount: "17151629734483090",
                            numberTranCAI: "",
                            serieCAI: "",
                            createInvoicingPendding: true,
                            codeAuthentication: "273815",
                            externalModule: '8',
                            savingAccountOperation: '11854',
                            useCode: "6753896",
                            deviceIMEI: "ebb6d4e2c9e1485e",
                            operationNumber: "0",
                            operativeDate: "0",
                            accountCode: "71249026",
                            serviceCode: '2',
                            collectionType: "TC_PREMOV",
                            carDepartment: "",
                            carType: "0",
                            carUseType: "0",
                            userToken: "",
                            codeSintesisModule: "3",
                            codesavingAccount: "117-2-1-17506-8",
                            codeMoney: "BS",
                            itemNumberCode: "00001",
                            itemAmount: "10.0",
                            batchDosage: "P49",
                            rentNumber: "1936538",
                            itemPeriod: "0",
                            itemDescription: "Monto mínimo: 5,00 ",
                            itemDate: "2025-10-30T15:50:19.9606798-04:00",
                            idSMSOperation: idSms,
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
