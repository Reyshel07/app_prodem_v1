import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/referenced/charge_references/presentation/bloc/charge_references_bloc.dart';
import 'package:app_prodem_v1/modules/referenced/insert_web_references/presentation/bloc/insert_web_references_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/generic_dropdown.dart';
import 'package:go_router/go_router.dart';

@RoutePage()
class InsertWebReferencesScreen extends StatefulWidget {
  final ChargeReferencesBloc chargeReferencesBloc;
  const InsertWebReferencesScreen({
    super.key,
    required this.chargeReferencesBloc,
  });

  @override
  State<InsertWebReferencesScreen> createState() =>
      _InsertWebReferencesScreenState();
}

//falsta completar
class _InsertWebReferencesScreenState extends State<InsertWebReferencesScreen> {
  final TextEditingController nameController = TextEditingController(
    text: 'Rashel',
  );
  final TextEditingController documentController = TextEditingController(
    text: '9151549',
  );
  final TextEditingController additionController = TextEditingController(
    text: 'LP',
  );
  final TextEditingController telephoneController = TextEditingController(
    text: '71579864',
  );
  final TextEditingController kinshipController = TextEditingController(
    text: 'hermano',
  );
  final TextEditingController amountController = TextEditingController(
    text: '255',
  );
  String? _selectedValueColTypes;
  String? _selectedValueMoney;
  String? _selectedProductId;
  String? _selectedMoneyId;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<InsertWebReferencesBloc>(),
        ),
        BlocProvider.value(value: widget.chargeReferencesBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Referenciados',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: BlocConsumer<ChargeReferencesBloc, ChargeReferencesState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ChargeReferencesSuccess) {
                final res = state.chargeReferencesResponseEntity.data;
                return Column(
                  children: [
                    Text(
                      'Nuevo Referenciado',
                      style: AppTextStyles.mainStyleGreen14Bold(context),
                    ),

                    GenericDropdown(
                      hint: 'Producto',
                      topPadding: topPadding,
                      items: res.colTypes
                          .map(
                            (type) => DropdownOption(
                              id: type.idClasificador.toString(),
                              label: type.nombre,
                            ),
                          )
                          .toList(),
                      valueId: _selectedProductId,
                      height: smallSpacing * 3,
                      onChanged: (newId) {
                        setState(() {
                          _selectedProductId = newId;
                          _selectedValueColTypes = newId == null
                              ? null
                              : res.colTypes
                                    .firstWhere(
                                      (e) =>
                                          e.idClasificador.toString() == newId,
                                    )
                                    .nombre;
                          // If selected product id is 600160, force amount=0 and money id=1
                          if (newId == '600160') {
                            amountController.text = '0';
                            _selectedMoneyId = '1';
                            try {
                              _selectedValueMoney = res.colMoneys
                                  .firstWhere(
                                    (e) => e.idClasificador.toString() == '1',
                                  )
                                  .nombre;
                            } catch (_) {
                              _selectedValueMoney = null;
                            }
                          } else {
                            // If switching away from special id, clear automatic defaults
                            if (amountController.text == '0') {
                              amountController.text = '';
                            }
                            if (_selectedMoneyId == '1') {
                              _selectedMoneyId = null;
                              _selectedValueMoney = null;
                            }
                          }
                        });
                      },
                    ),

                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: nameController,
                      lbText: 'Nombre',
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: documentController,
                      lbText: 'Nro. Documento',
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: additionController,
                      lbText: 'Complemento',
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: telephoneController,
                      lbText: 'Telefono/Celular',
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: kinshipController,
                      lbText: 'Parentesco',
                    ),
                    if (_selectedProductId != '600160')
                      GenericDropdown(
                        hint: 'Moneda',
                        items: res.colMoneys
                            .map(
                              (m) => DropdownOption(
                                id: m.idClasificador.toString(),
                                label: m.nombre,
                              ),
                            )
                            .toList(),
                        valueId: _selectedMoneyId,
                        height: smallSpacing * 3,
                        topPadding: topPadding,
                        onChanged: (newId) {
                          setState(() {
                            _selectedMoneyId = newId;
                            _selectedValueMoney = newId == null
                                ? null
                                : res.colMoneys
                                      .firstWhere(
                                        (e) =>
                                            e.idClasificador.toString() ==
                                            newId,
                                      )
                                      .nombre;
                          });
                        },
                      ),
                    if (_selectedProductId != '600160')
                      TextFromFiel02(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: amountController,
                        lbText: 'Monto',
                      ),
                    Center(
                      child: Row(
                        children: [
                          Butoon1(onTap: () {}, lblTextField: 'CANCELAR'),
                          BlocConsumer<
                            InsertWebReferencesBloc,
                            InsertWebReferencesState
                          >(
                            listener: (context, state) {
                              if (state is InsertWebReferencesSuccess) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Exito'),
                                      content: Butoon1(
                                        onTap: () {
                                          context.pop();
                                        },
                                        lblTextField: 'Ok',
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            builder: (context, state) {
                              return Butoon1(
                                onTap: () {
                                  final isSpecial =
                                      _selectedProductId == '600160';
                                  final amountToSend = isSpecial
                                      ? '0'
                                      : amountController.text;
                                  final idMoneyToSend = isSpecial
                                      ? '1'
                                      : (_selectedMoneyId ?? '');
                                  final shortNameMoneyToSend = isSpecial
                                      ? (_selectedValueMoney ?? '')
                                      : (_selectedValueMoney ?? '');
                                  context.read<InsertWebReferencesBloc>().add(
                                    InsertWebRefereEvent(
                                      idWebReferences: '0',
                                      fullName: nameController.text,
                                      identityCardNumber:
                                          documentController.text,
                                      cellPhoneNumber: telephoneController.text,
                                      kinship: kinshipController.text,
                                      idcProduct: _selectedProductId ?? '',
                                      productName: _selectedValueColTypes ?? '',
                                      idMoney: idMoneyToSend,
                                      shortName: shortNameMoneyToSend,
                                      ammount: amountToSend,
                                      isActive: true,
                                    ),
                                  );
                                },
                                lblTextField: 'GUARDAR',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
