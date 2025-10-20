import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/presentation/bloc/report_movement_by_person_and_date_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class ReportMovementByPErsonAndDateScreen extends StatefulWidget {
  const ReportMovementByPErsonAndDateScreen({super.key});

  @override
  State<ReportMovementByPErsonAndDateScreen> createState() =>
      _ReportMovementByPErsonAndDateScreenState();
}

class _ReportMovementByPErsonAndDateScreenState
    extends State<ReportMovementByPErsonAndDateScreen> {
  String? _selectedValueMoney;
  DateTime? _fechaSeleccionada;
  DateTime? _fechaSeleccionada2;

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? fechaElegida = await showDatePicker(
      context: context,
      initialDate: _fechaSeleccionada ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('es', ''),
    );

    if (fechaElegida != null && fechaElegida != _fechaSeleccionada) {
      setState(() {
        _fechaSeleccionada = fechaElegida;
      });
    }
  }

  Future<void> _seleccionarFecha2(BuildContext context) async {
    final DateTime? fechaElegida = await showDatePicker(
      context: context,
      initialDate: _fechaSeleccionada2 ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('es', ''),
    );

    if (fechaElegida != null && fechaElegida != _fechaSeleccionada2) {
      setState(() {
        _fechaSeleccionada2 = fechaElegida;
      });
    }
  }

  List<String> listMovimientos = ['Todos', 'Cobro QR Prodem', 'Pago QR Prodem'];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    final fechaTexto = _fechaSeleccionada != null
        ? DateFormat('dd/MM/yyyy').format(_fechaSeleccionada!)
        : 'dd/mm/aaaa';
    final fechaTexto2 = _fechaSeleccionada2 != null
        ? DateFormat('dd/MM/yyyy').format(_fechaSeleccionada2!)
        : 'dd/mm/aaaa';

    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<ReportMovementByPersonAndDateBloc>(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Consultar Movimientos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              ReportMovementByPersonAndDateBloc,
              ReportMovementByPersonAndDateState
            >(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.all(topPadding * 0.05),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDropdown(
                          title: 'Tipo de Movimiento',
                          items: listMovimientos,
                          value: _selectedValueMoney,
                          onChanged: (newValue) {
                            setState(() => _selectedValueMoney = newValue);
                          },
                          smallSpacing: smallSpacing,
                        ),
                        SizedBox(height: smallSpacing * 0.8),
                        Text(
                          'Fechas:',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextIcon(
                                  onTap: () => _seleccionarFecha(context),
                                  prefix: Icon(
                                    Icons.date_range,
                                    color: Theme.of(context).colorScheme.green,
                                  ),
                                  text: 'Desde: $fechaTexto',
                                  textStyle: AppTextStyles.mainStyleGreen14Bold(
                                    context,
                                  ),
                                  suffix: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Theme.of(context).colorScheme.green,
                                  ),
                                ),
                                TextIcon(
                                  onTap: () => _seleccionarFecha2(context),
                                  prefix: Icon(
                                    Icons.date_range,
                                    color: Theme.of(context).colorScheme.green,
                                  ),
                                  text: 'Hasta: $fechaTexto2',
                                  textStyle: AppTextStyles.mainStyleGreen14Bold(
                                    context,
                                  ),
                                  suffix: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Theme.of(context).colorScheme.green,
                                  ),
                                ),
                              ],
                            ),
                            ElevateButton1(
                              onTap: () {
                                context
                                    .read<ReportMovementByPersonAndDateBloc>()
                                    .add(
                                      ReportMovementByPersonAndDatEvent(
                                        movementType: 0,
                                        dateIni: fechaTexto,
                                        dateFin: fechaTexto2,
                                      ),
                                    );
                              },
                              lblTextField: 'Buscar',
                            ),
                          ],
                        ),
                        SizedBox(height: smallSpacing),
                        BlocBuilder<
                          ReportMovementByPersonAndDateBloc,
                          ReportMovementByPersonAndDateState
                        >(
                          builder: (context, state) {
                            if (state is ReportMovementByPersonAndDateSuccess) {
                              final res = state
                                  .getReportMovementsByPersonAndDateEntity
                                  .colMovements;
                              return Column(
                                children: [
                                  Text(
                                    'Detalle de movimientos:',
                                    style: AppTextStyles.mainStyleGreen14Bold(
                                      context,
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: res.length,
                                    itemBuilder: (context, index) {
                                      final data = res[index];
                                      return Card(
                                        elevation: smallSpacing * 0.5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.green,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              topPadding * 0.05,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '${data.clientName}\n${data.detail}',
                                                    style:
                                                        AppTextStyles.mainStyleGreen12(
                                                          context,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  data.amount,
                                                  style:
                                                      AppTextStyles.mainStyleGreen14Bold(
                                                        context,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            } else if (state
                                is ReportMovementByPersonAndDateLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state
                                is ReportMovementByPersonAndDateError) {
                              return Center(child: Text(state.message));
                            }
                            return const SizedBox();
                          },
                        ),
                      ],
                    ),
                  ),
                );
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
            padding: EdgeInsets.all(smallSpacing * 0.5),
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
