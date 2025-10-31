import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/presentation/bloc/initial_charge_bank_guarantee_bloc.dart';
import 'package:app_prodem_v1/modules/get_list_departments/presentation/bloc/get_list_departments_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
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

  String? _selectedAccount;
  String? _selectedDepartamento;
  String? _selectedFianzaValue;
  String? _selectedBeneficiarioValue;
  String? _selectedOjeFianzaValue;
  String? _selectedMonedaValue;
  bool isChecked = false;

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
                        /*BlocConsumer<
                          GetListDepartmentsBloc,
                          GetListDepartmentsState
                        >(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is GetListDepartmentsSuccess) {
                              final res =
                                  state.getListDepartmentsResponseEntity.data;
                              final nameClassifierEntity = res
                                  .map((name) => name.nameClassifierEntity)
                                  .toList();
                              return Column(
                                children: [
                                  _buildDropdown(
                                    title: 'Departamento:',
                                    items: nameClassifierEntity,
                                    value: _selectedDepartamento,
                                    onChanged: (newValue) {
                                      setState(
                                        () => _selectedDepartamento = newValue,
                                      );
                                    },
                                    smallSpacing: smallSpacing,
                                  ),
                                  _buildDropdown(
                                    title: 'Beneficiario',
                                    items: beneficiario,
                                    value: _selectedBeneficiarioValue,
                                    onChanged: (newValue) {
                                      setState(
                                        () => _selectedBeneficiarioValue =
                                            newValue,
                                      );
                                    },
                                    smallSpacing: smallSpacing,
                                  ),
                                ],
                              );
                            }
                            return SizedBox();
                          },
                        ),*/
                        BlocConsumer<
                          GetListDepartmentsBloc,
                          GetListDepartmentsState
                        >(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is GetListDepartmentsSuccess) {
                              final res =
                                  state.getListDepartmentsResponseEntity.data;

                              return Column(
                                children: [
                                  _buildDropdown1(
                                    title: 'Departamento:',
                                    items: res
                                        .map((e) => e.nameClassifierEntity)
                                        .toList(),
                                    value: _selectedDepartamento,
                                    onChanged: (newValue) {
                                      setState(
                                        () => _selectedDepartamento = newValue,
                                      );

                                      // ✅ Buscar el objeto completo por nombre
                                      final selected = res.firstWhere(
                                        (e) =>
                                            e.nameClassifierEntity == newValue,
                                      );

                                      // ✅ Aquí obtienes el ID correctamente
                                      final int id =
                                          selected.idClassifierEntity!;

                                      // ✅ Ejecutar segundo servicio pasándole el ID
                                      context
                                          .read<GetListDepartmentsBloc>()
                                          .add(
                                            GetListLocationDepartmentsEvent(
                                              idDepartment: id.toString(),
                                            ),
                                          );
                                    },
                                    smallSpacing: smallSpacing,
                                  ),
                                  BlocBuilder<
                                    GetListDepartmentsBloc,
                                    GetListDepartmentsState
                                  >(
                                    builder: (context, state) {
                                      if (state
                                          is GetListLocationDepartmentsSuccess) {
                                        return _buildDropdown1(
                                          title: 'Beneficiario',
                                          items: state
                                              .getListLocationDepartmentsResponseEntity
                                              .data
                                              .map(
                                                (res) =>
                                                    res.nameClassifierEntity,
                                              )
                                              .toList(),
                                          value: _selectedBeneficiarioValue,
                                          onChanged: (newValue) {
                                            setState(
                                              () => _selectedBeneficiarioValue =
                                                  newValue,
                                            );
                                          },
                                          smallSpacing: smallSpacing,
                                        );
                                      }

                                      if (state is GetMoneyByAccountLoading) {
                                        return const CircularProgressIndicator();
                                      }

                                      return const SizedBox();
                                    },
                                  ),
                                ],
                              );
                            }

                            if (state is GetListDepartmentsLoading) {
                              return const CircularProgressIndicator();
                            }

                            return const SizedBox();
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
                              '¿La fianza es para una entidad pública?',
                              style: AppTextStyles.mainStyleGreen14Bold(
                                context,
                              ),
                            ),
                          ],
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
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: beneficiarioController,
                          lbText: 'Baneficiario',
                        ),
                        _buildDropdown(
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
                          lbText: 'Monto Solicitadeo:',
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
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: dayController,
                          lbText: 'Plazo en dias:',
                        ),
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: dayController,
                          lbText: 'Fecha de puesta en vigencia:',
                        ),
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: dayController,
                          lbText: 'Fecha de vencimiento:',
                        ),
                        Text(
                          'Verifique e ingrese la informacion correcta',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        _buildDropdown(
                          title: 'Objeto de Fianza Bancaria',
                          items: objFianzaBank,
                          value: _selectedOjeFianzaValue,
                          onChanged: (newValue) {
                            setState(() => _selectedOjeFianzaValue = newValue);
                          },
                          smallSpacing: smallSpacing,
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
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() => isChecked = value ?? false);
                              },
                            ),
                            Text(
                              'Términos y condiciones',
                              style: AppTextStyles.mainStyleGreen14Bold(
                                context,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Butoon1(onTap: () {}, lblTextField: 'CONTINUAR'),
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

  Widget _buildDropdown1({
    required String title,
    required List<String> items,
    required String? value,
    required Function(String?) onChanged,
    required double smallSpacing,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: smallSpacing),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
