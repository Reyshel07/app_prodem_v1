import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/presentation/bloc/get_office_list_by_id_geo_bloc.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/presentation/bloc/get_parameters_to_digital_dpf_bloc.dart'
    hide GetOfficeListByIdGeoSuccess;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class ParametersToDigitalDpfScreen extends StatefulWidget {
  final GetParametersToDigitalDpfBloc bloc;
  final SessionInfoBloc sessioninfo;
  const ParametersToDigitalDpfScreen({
    super.key,
    required this.sessioninfo,
    required this.bloc,
  });

  @override
  State<ParametersToDigitalDpfScreen> createState() =>
      _ParametersToDigitalDpfScreenState();
}

class _ParametersToDigitalDpfScreenState
    extends State<ParametersToDigitalDpfScreen> {
  final TextEditingController currencyController = TextEditingController(
    text: 'BS',
  );
  final TextEditingController emailController = TextEditingController(
    text: '71579864jp@gmail.com',
  );
  final TextEditingController amountInBsController = TextEditingController();
  final TextEditingController deadlineInDaysController =
      TextEditingController();
  final TextEditingController annualInterestRateController =
      TextEditingController();
  final TextEditingController interestEarnedController =
      TextEditingController();
  final TextEditingController mountDpfController = TextEditingController();
  //String? _selectedDepartValue;
  String? _selectedAgenciaValue;
  int? _selectedDepartamentoId;
  bool isChecked = false;

  String? _selectedAccount;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.sessioninfo),
        BlocProvider.value(value: widget.bloc),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<GetOfficeListByIdGeoBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'SOLICITUD DE DPF EN LÍNEA',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocBuilder<GetParametersToDigitalDpfBloc, GetParametersToDigitalDpfState>(
          builder: (context, state) {
            if (state is GetParametersToDigitalDpfSuccess) {
              final res = state.response.data;
              final listDep = res.colGeographicLocations;
              // lee los valores de los controllers como String
              final daysStr = deadlineInDaysController.text;
              final amountStr = amountInBsController.text;
              final rateStr = annualInterestRateController.text;

              // conviértelos a double
              final days = double.tryParse(daysStr) ?? 0;
              final amount = double.tryParse(amountStr) ?? 0;
              final rate = double.tryParse(rateStr) ?? 0;

              // fórmula del interés
              final interes = (days * amount * rate) / 36000;

              // si quieres mostrarlo como texto
              interestEarnedController.text = interes.toStringAsFixed(2);
              final total = (interes + amountStr.toInt());
              mountDpfController.text = total.toStringAsFixed(2);
              return Padding(
                padding: EdgeInsets.all(topPadding * 0.05),
                child: ListView(
                  children: [
                    Text(
                      'NUEVA SOLICITUD DE DPF',
                      style: AppTextStyles.mainStyleGreen18Bold(context),
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
                    Card(
                      elevation: smallSpacing * 0.5,
                      child: Container(
                        width: double.infinity,
                        height: smallSpacing * 3,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.green,
                          ),
                          borderRadius: BorderRadius.all(radiusCircular(11)),
                        ),
                        child: DropdownButton<int>(
                          underline: const SizedBox(),
                          padding: EdgeInsets.all(smallSpacing * 0.5),
                          isExpanded: true,
                          hint: const Text("Seleccione un departamento"),
                          value: _selectedDepartamentoId,
                          items: listDep.map((dep) {
                            return DropdownMenuItem<int>(
                              value: dep.idClassifierEntity,
                              child: Text(dep.nameClassifierEntity),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedDepartamentoId = newValue;
                            });
                            context.read<GetOfficeListByIdGeoBloc>().add(
                              GetOfficeListByIdGeoEvent(idGeo: newValue!),
                            );
                          },
                        ),
                      ),
                    ),
                    BlocConsumer<
                      GetOfficeListByIdGeoBloc,
                      GetOfficeListByIdGeoState
                    >(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is GetOfficeListByIdGeoSuccess) {
                          final agencias = state.offices;
                          final res = agencias
                              .map((account) => account.nameClassifierEntity)
                              .toList();

                          return _buildDropdown(
                            title: 'Agencias',
                            items: res,
                            value: _selectedAgenciaValue,
                            onChanged: (newValue) {
                              setState(() => _selectedAgenciaValue = newValue);
                            },
                            smallSpacing: smallSpacing,
                          );
                        }

                        if (state is GetParametersToDigitalDpfLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                    SizedBox(height: smallSpacing * 0.5),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: currencyController,
                      lbText: 'Moneda',
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: emailController,
                      lbText: 'Correo electronico:',
                    ),
                    SizedBox(
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.green,
                            ),
                            borderRadius: BorderRadius.all(radiusCircular(11)),
                          ),
                          child: TextFormField(
                            //keyboardType: TextInputType.number,
                            controller: amountInBsController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Monto en Bs a partir de 700bs',
                              hintStyle: AppTextStyles.mainStyleGreen14(
                                context,
                              ),
                              filled: false,
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            ),
                            validator: (value) {
                              final min1 = res.colAmounts[0].minimumAmount;
                              final max1 = res.colAmounts[0].maximumAmount;

                              if (value == null || value.trim().isEmpty) {
                                return 'Este campo es obligatorio';
                              }

                              final parsed = double.tryParse(value);
                              if (parsed == null) {
                                return 'Ingresa un número válido';
                              }

                              if (parsed < min1) {
                                return 'El monto mínimo es $min1';
                              } else if (parsed > max1) {
                                return 'El monto máximo es $max1';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.green,
                            ),
                            borderRadius: BorderRadius.all(radiusCircular(11)),
                          ),
                          child: TextFormField(
                            controller: deadlineInDaysController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Plaxo en dias',
                              hintStyle: AppTextStyles.mainStyleGreen14(
                                context,
                              ),
                              filled: false,
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            ),
                            onChanged: (value) {
                              final days = int.tryParse(value);
                              if (days != null) {
                                final matches = res.colRates
                                    .where(
                                      (r) =>
                                          days >= r.minimumTerm &&
                                          days <= r.maximumTerm,
                                    )
                                    .toList();

                                if (matches.isNotEmpty) {
                                  // Asigna la tasa (como decimal). Si prefieres porcentaje: multiply by 100 y formatea.
                                  annualInterestRateController.text = matches
                                      .first
                                      .rate
                                      .toString();
                                } else {
                                  annualInterestRateController.clear();
                                }
                              } else {
                                annualInterestRateController.clear();
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.green,
                            ),
                            borderRadius: BorderRadius.all(radiusCircular(11)),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: annualInterestRateController,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            readOnly: true,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Tasa de interés anual',
                              hintStyle: AppTextStyles.mainStyleGreen14(
                                context,
                              ),
                              filled: false,
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.green,
                            ),
                            borderRadius: BorderRadius.all(radiusCircular(11)),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: interestEarnedController,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            readOnly: true,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Interéz ganado',
                              hintStyle: AppTextStyles.mainStyleGreen14(
                                context,
                              ),
                              filled: false,
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    /*TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: interestEarnedController,
                      lbText: 'Interéz ganado',
                    ),*/
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: mountDpfController,
                      lbText: 'Monto final DPF (Capital + Interés)',
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Theme.of(context).colorScheme.green,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() => isChecked = value ?? false);
                            if (value == true) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    //title: const Text("Confirmación"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: screenSize.height * 0.5,
                                          width: double.maxFinite,
                                          child: ListView(
                                            children: [
                                              Html(
                                                data: res.termAndConditions,
                                                style: {
                                                  "p": Style(
                                                    fontSize: FontSize(14.0),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                  "h6": Style(
                                                    fontSize: FontSize(18.0),
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.green,
                                                    fontWeight: FontWeight.bold,
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                  "li": Style(
                                                    padding:
                                                        HtmlPaddings.symmetric(
                                                          vertical: 4,
                                                        ),
                                                    fontSize: FontSize(14.0),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        Row(
                                          children: [
                                            Checkbox(
                                              activeColor: Theme.of(
                                                context,
                                              ).colorScheme.green,
                                              value: value,
                                              onChanged: (value) {
                                                setState(
                                                  () => isChecked =
                                                      value ?? false,
                                                );
                                              },
                                            ),
                                            Text(
                                              'ACEPTO LOS TERMINOS Y CONDICIONES.',
                                              style:
                                                  AppTextStyles.mainStyleGreen10Bold(
                                                    context,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          "Cancelar",
                                          style:
                                              AppTextStyles.mainStyleGreen14Bold(
                                                context,
                                              ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          "Continuar",
                                          style:
                                              AppTextStyles.mainStyleGreen14Bold(
                                                context,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                        Text(
                          'Términos y condiciones',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Butoon1(onTap: () {}, lblTextField: 'Continuar'),
                        Butoon1(onTap: () {}, lblTextField: 'Tarifario'),
                        Butoon1(onTap: () {}, lblTextField: 'Cancelar'),
                      ],
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
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
