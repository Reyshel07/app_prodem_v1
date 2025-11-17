import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/presentation/bloc/bloc/get_bank_guarantee_class_bloc.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/presentation/bloc/initial_charge_bank_guarantee_bloc.dart';
import 'package:app_prodem_v1/modules/get_list_departments/domain/entities/get_list_departments_entity.dart';
import 'package:app_prodem_v1/modules/get_list_departments/presentation/bloc/get_list_departments_bloc.dart';
import 'package:app_prodem_v1/modules/get_list_departments/presentation/bloc/get_list_location_departments_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/custom_check_box.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class InitialChargeBankGuaranteScreen extends StatefulWidget {
  final InitialChargeBankGuaranteeBloc bloc;
  final SessionInfoBloc sessionBloc;
  const InitialChargeBankGuaranteScreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
  });

  @override
  State<InitialChargeBankGuaranteScreen> createState() =>
      _InitialChargeBankGuaranteScreenState();
}

class _InitialChargeBankGuaranteScreenState
    extends State<InitialChargeBankGuaranteScreen> {
  final TextEditingController beneficiarioController = TextEditingController();
  final TextEditingController amountSoliciController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController cuceController = TextEditingController();
  final TextEditingController propositoController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  String? _selectedAccount;
  //String? _selectedDepartamento;
  String? _selectedFianzaValue;
  String? _selectedBeneficiarioValue;
  String? _selectedOjeFianzaValue;
  String? _selectedMonedaValue;
  bool isChecked = false;
  bool isChecked1 = false;
  List<GetListDepartmentsEntity> _departamentos = [];
  List<GetListLocationDepartmentsEntity> _agencias = [];

  String? _selectedDepartamento;
  int? _selectedDepartamentoId;

  String? _selectedAgencia;
  int? _selectedAgenciaId;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.sessionBloc),
        BlocProvider.value(value: widget.bloc),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<GetListDepartmentsBloc>()
                ..add(GetListDepaEvent()),
        ),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<GetListLocationDepartmentsBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<GetBankGuaranteeClassBloc>(),
        ),
      ],
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
            BlocConsumer<
              InitialChargeBankGuaranteeBloc,
              InitialChargeBankGuaranteeState
            >(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is InitialChargeBankGuaranteeSuccess) {
                  final colBankGuaranteeType =
                      state.data.data.colBankGuaranteeType;
                  final tipoFianza = colBankGuaranteeType
                      .map((account) => account.nombre)
                      .toList();
                  final colBeneficiary = state.data.data.colBeneficiary;
                  final beneficiario = colBeneficiary
                      .map((account) => account.nombre)
                      .toList();
                  final colBankGuarantee = state.data.data.colBankGuarantee;
                  final objFianzaBank = colBankGuarantee
                      .map((account) => account.nombre)
                      .toList();

                  return Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: ListView(
                      children: [
                        Text(
                          'Nueva Solicitud',
                          style: AppTextStyles.mainStyleGreen16Bold(context),
                        ),
                        Text(
                          'Datos',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        BlocConsumer<
                          GetListDepartmentsBloc,
                          GetListDepartmentsState
                        >(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is GetListDepartmentsSuccess) {
                              _departamentos =
                                  state.getListDepartmentsResponseEntity.data;

                              final nombresDepartamentos = _departamentos
                                  .map((e) => e.nameClassifierEntity)
                                  .toList();

                              return Column(
                                children: [
                                  _buildDropdown(
                                    title: 'Departamento:',
                                    items: nombresDepartamentos,
                                    value: _selectedDepartamento,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedDepartamento = newValue;

                                        final seleccionado = _departamentos
                                            .firstWhere(
                                              (e) =>
                                                  e.nameClassifierEntity ==
                                                  newValue,
                                            );

                                        _selectedDepartamentoId =
                                            seleccionado.idClassifierEntity;

                                        context
                                            .read<
                                              GetListLocationDepartmentsBloc
                                            >()
                                            .add(
                                              GetListLocationDepartmenEvent(
                                                idDepartment:
                                                    _selectedDepartamentoId!
                                                        .toString(),
                                              ),
                                            );
                                      });
                                    },
                                    smallSpacing: smallSpacing,
                                  ),

                                  SizedBox(height: smallSpacing * 1.2),
                                  BlocConsumer<
                                    GetListLocationDepartmentsBloc,
                                    GetListLocationDepartmentsState
                                  >(
                                    listener: (context, state) {},

                                    builder: (context, state) {
                                      if (state
                                          is GetListLocationDepartmentsLoading) {
                                        return CircularProgressIndicator();
                                      }

                                      if (state
                                          is GetListLocationDepartmentsSuccess) {
                                        _agencias = state
                                            .getListLocationDepartmentsResponseEntity
                                            .data;

                                        final nombresAgencias = _agencias
                                            .map((e) => e.nameClassifierEntity)
                                            .toList();

                                        return _buildDropdown(
                                          title: 'Agencia:',
                                          items: nombresAgencias,
                                          value: _selectedAgencia,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedAgencia = newValue;

                                              final seleccionado = _agencias
                                                  .firstWhere(
                                                    (e) =>
                                                        e.nameClassifierEntity ==
                                                        newValue,
                                                  );

                                              _selectedAgenciaId = seleccionado
                                                  .idClassifierEntity;
                                            });
                                          },
                                          smallSpacing: smallSpacing,
                                        );
                                      }

                                      return Container(
                                        height: smallSpacing * 3,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Seleccione un departamento",
                                          style:
                                              AppTextStyles.mainStyleGreen14Bold(
                                                context,
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            }

                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                        CustomCheckBox(
                          value: isChecked,
                          label: '¿La fianza es para una entidad pública?',
                          styText: AppTextStyles.mainStyleGreen14Bold(context),
                          onChanged: (value) {
                            final newValue = value ?? false;
                            setState(() => isChecked = newValue);

                            context.read<GetBankGuaranteeClassBloc>().add(
                              GetBankGuarClassEvent(isPublic: newValue),
                            );
                          },
                        ),
                        Text(
                          'Nueva solicitud',
                          style: AppTextStyles.mainStyleGreen16Bold(context),
                        ),
                        _buildDropdown(
                          title: 'Tipo de Fianza',
                          items: tipoFianza,
                          value: _selectedFianzaValue,
                          onChanged: (newValue) {
                            setState(() => _selectedFianzaValue = newValue);
                          },
                          smallSpacing: smallSpacing,
                        ),
                        isChecked == false
                            ? TextFromFiel02(
                                screenSize: screenSize,
                                smallSpacing: smallSpacing,
                                userController: beneficiarioController,
                                lbText: 'Beneficiario',
                              )
                            : _buildDropdown(
                                title: 'Beneficiario',
                                items: beneficiario,
                                value: _selectedBeneficiarioValue,
                                onChanged: (newValue) {
                                  setState(
                                    () => _selectedBeneficiarioValue = newValue,
                                  );
                                },
                                smallSpacing: smallSpacing,
                              ),
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
                          userController: amountSoliciController,
                          lbText: 'Monto Solicitado:',
                        ),
                        _buildDropdown(
                          title: 'Moneda',
                          items: objFianzaBank,
                          value: _selectedMonedaValue,
                          onChanged: (newValue) {
                            setState(() => _selectedMonedaValue = newValue);
                          },
                          smallSpacing: smallSpacing,
                        ),
                        Text(
                          'El plazo no puede ser mayor a 10 años en dias',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        TextFromFiel03(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: dayController,
                          lbText: 'Plazo en días:',
                          enabled: true,
                          onChanged: updateDates,
                        ),

                        TextFromFiel03(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: startDateController,
                          lbText: 'Fecha de puesta en vigencia:',
                          enabled: false,
                        ),

                        TextFromFiel03(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: endDateController,
                          lbText: 'Fecha de vencimiento:',
                          enabled: false,
                        ),

                        Text(
                          'Verifique e ingrese la informacion correcta',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        BlocConsumer<
                          GetBankGuaranteeClassBloc,
                          GetBankGuaranteeClassState
                        >(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is GetBankGuaranteeClassSuccess) {
                              final res = state
                                  .getBankGuaranteeClassResponseEntity
                                  .data;
                              final nombre = res
                                  .map((name) => name.nombre)
                                  .toList();
                              return _buildDropdown(
                                title: 'Objeto de Fianza Bancaria',
                                items: nombre,
                                value: _selectedOjeFianzaValue,
                                onChanged: (newValue) {
                                  setState(
                                    () => _selectedOjeFianzaValue = newValue,
                                  );
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
                          userController: cuceController,
                          lbText:
                              'Cuce (Numero de la publicación de la fianza):',
                        ),
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: propositoController,
                          lbText: 'Propósito:',
                        ),
                        CustomCheckBox(
                          value: isChecked1,
                          label: 'Términos y condiciones',
                          styText: AppTextStyles.mainStyleGreen14Bold(context),
                          onChanged: (value) {
                            if (value == true) {
                              _showTermsDialog();
                            } else {
                              setState(() => isChecked1 = false);
                            }
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isChecked1)
                              Butoon1(
                                onTap: () {
                                  InjectorContainer.getIt<AppRouter>().push(
                                    BankSecuritySolicitationResulRoute(),
                                  );
                                },
                                lblTextField: 'CONTINUAR',
                              ),
                            Butoon1(onTap: () {}, lblTextField: 'CANCELAR'),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return SizedBox();
              },
            ),
      ),
    );
  }

  void _showTermsDialog() {
    bool internalChecked = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text(
                'Términos y condiciones',
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Autorizo a Banco Prodem Realizar la consulta de la central de riesgos de los burós de informacion de la ASFI e INFOCRED y del SEGIP. Tambien autorizo realizar el débito de mi caja de ahorro por el consepto de comisión de la Fianza Bancaria, asi como el bloqueo del monto solicitado.',
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.mainStyleGreen12(context),
                  ),
                  CustomCheckBox(
                    value: internalChecked,
                    label: 'ACEPTO LOS TERMINOS Y CONDICIONES',
                    styText: AppTextStyles.mainStyleGreen10Bold(context),
                    onChanged: (value) {
                      setState(() => internalChecked = value ?? false);
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: AppTextStyles.mainStyleGreen12Bold(context),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (internalChecked) {
                      setState(() => isChecked1 = true);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Aceptar",
                    style: AppTextStyles.mainStyleGreen12Bold(context),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void updateDates(String value) {
    if (value.isEmpty) {
      startDateController.text = "";
      endDateController.text = "";
      return;
    }

    final int? days = int.tryParse(value);
    if (days == null) return;

    final DateTime now = DateTime.now();
    final DateTime endDate = now.add(Duration(days: days));

    startDateController.text = "${now.day}/${now.month}/${now.year}";
    endDateController.text = "${endDate.day}/${endDate.month}/${endDate.year}";
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
