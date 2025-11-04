import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/bank_security_solicitation_result/presentation/bloc/bank_security_solicitation_result_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class BankSecuritySolicitationResulScreen extends StatefulWidget {
  const BankSecuritySolicitationResulScreen({super.key});

  @override
  State<BankSecuritySolicitationResulScreen> createState() =>
      _BankSecuritySolicitationResulScreenState();
}

class _BankSecuritySolicitationResulScreenState
    extends State<BankSecuritySolicitationResulScreen> {
  final TextEditingController currentAssetsController = TextEditingController();
  final TextEditingController fixedAssetController = TextEditingController();
  final TextEditingController otherAssetsController = TextEditingController();
  final TextEditingController liabilitiesController = TextEditingController();
  final TextEditingController grossMonthlySalesController =
      TextEditingController();
  final TextEditingController costOfSalesController = TextEditingController();
  final TextEditingController operatingExpensesController =
      TextEditingController();
  final TextEditingController otherIncomeController = TextEditingController();
  final TextEditingController paymentOfLiabilitiesController =
      TextEditingController();
  final TextEditingController familyExpensesController =
      TextEditingController();
  final TextEditingController otherAsseController = TextEditingController();
  final TextEditingController numberOfEmployeesController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<BankSecuritySolicitationResultBloc>(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Solicitud de fianzas Bancarias',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              BankSecuritySolicitationResultBloc,
              BankSecuritySolicitationResultState
            >(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.all(topPadding * 0.05),
                  child: ListView(
                    children: [
                      Text(
                        'Declaración Jurada',
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                      Text(
                        'Complete la informacion requerida',
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                      Text(
                        'Llene su Declaración Jurada en moneda de su Fianza Bancaria, en caso de que su solicitud sea en UFV la declaración debe se llenada en BS',
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: TextEditingController(text: 'BS'),
                        lbText: 'Moneda de la cuenta:',
                      ),
                      Text(
                        'Balance General',
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: currentAssetsController,
                        lbText: 'Activo circulante:',
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: fixedAssetController,
                        lbText: 'Activo fijo:',
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: otherAssetsController,
                        lbText: 'Otros activos:',
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: liabilitiesController,
                        lbText: 'Pasivos:',
                      ),
                      Text(
                        'Estado de Resultados',
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: grossMonthlySalesController,
                        lbText: 'Ventas mensuales brutas:',
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: costOfSalesController,
                        lbText: 'Costo de ventas:',
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: operatingExpensesController,
                        lbText: 'Gastos operativos:',
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: otherIncomeController,
                        lbText: 'Otros ingresos:',
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: familyExpensesController,
                        lbText: 'Gastos familiares:',
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: paymentOfLiabilitiesController,
                        lbText: 'Pago de pasivos:',
                      ),
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: numberOfEmployeesController,
                        lbText: 'Numero de empleados',
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Butoon1(
                            onTap: () {
                              context
                                  .read<BankSecuritySolicitationResultBloc>()
                                  .add(
                                    BankSecuritySolicitationResEvent(
                                      activocirculante: '200.0',
                                      activofijo: "200.0",
                                      beneficiario: "AASANA",
                                      cUCE: "",
                                      fechaInicioString: "24-10-2025",
                                      gastosfamiliares: "10.0",
                                      gastosOperativos: "10.0",
                                      idBankGuaranteeClass: "14",
                                      idBankGuaranteeProduct: "3",
                                      idMoneda: "1",
                                      idMonedaCuenta: "1",
                                      idOfficeTarget: "84",
                                      idSavingAccount: "17151629734483090",
                                      identityCardNumber: "6753896",
                                      moneda: "BS",
                                      monedaCuenta: "BS",
                                      montoSolicitado: "1000",
                                      nroEmpleados: "1",
                                      objetoBoleta:
                                          "CORRECTA INVERSION DE ANTICIPO",
                                      otrosactivos: "0.0",
                                      otrosIngresos: "0.0",
                                      pagopasivos: "0.0",
                                      pasivos: "0.0",
                                      personName:
                                          "ROBLES VISCARRA SANDRO SIXTO",
                                      plazo: "31",
                                      proposito: "yjjj",
                                      tipoBoleta: "BOLETA DE GARANTIA",
                                      ventasMensualesBrutas: "200.0",
                                      codeOffice: "",
                                      officeName: "",
                                      siregarName: "",
                                      departamento: "Cochabamba",
                                      idClasificador: "1",
                                      code: "",
                                      nombre: "BS",
                                      codeSavingsAccountOrigin: "",
                                      costodeVentas: "",
                                      idSMSOperation: "",
                                      prodemKeyCode: "",
                                    ),
                                  );
                            },
                            lblTextField: 'FINALIZAR',
                          ),
                          Butoon1(onTap: () {}, lblTextField: 'CANCELAR'),
                        ],
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
