import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/domain/entities/sintesis_get_search_parameters_by_module_entity.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_obtain_operating_debt_balance/presentation/bloc/sintesis_obtain_operating_debt_balance_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SintesisGetSearchParametersByModuleScreen extends StatefulWidget {
  final String name;
  final String description;
  final String externalModule;
  final List<SintesisGetSearchParametersByModuleEntity> res;
  const SintesisGetSearchParametersByModuleScreen({
    super.key,
    required this.name,
    required this.description,
    required this.externalModule,
    required this.res,
  });

  @override
  State<SintesisGetSearchParametersByModuleScreen> createState() =>
      _SintesisGetSearchParametersByModuleScreenState();
}

class _SintesisGetSearchParametersByModuleScreenState
    extends State<SintesisGetSearchParametersByModuleScreen> {
  String? _selectedValue;
  String? codeModule;
  String? moduleName;
  SintesisGetSearchParametersByModuleEntity? _selectedItem;
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  final TextEditingController thirdController = TextEditingController();

  bool isChecked = false;
  final List<String> _noDropdownModules = [
    'DELAPAZ',
    'PÓLIZAS DE TERCEROS',
    'VEHICULOS',
    'INFRACCIONES',
  ];
  final List<String> _nofavoritesModules = [
    'PÓLIZAS DE TERCEROS',
    'GESTORA PUBLICA',
    'PAGOSNET',
  ];
  final List<String> _noTextModules = [
    'DELAPAZ',
    'PÓLIZAS DE TERCEROS',
    'VEHICULOS',
    'INMUEBLES',
    'INFRACCIONES',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    String getLabelTextByModule() {
      switch (widget.name.toUpperCase()) {
        case 'CESSA':
          return 'Nro. Cliente:';
        case 'DELAPAZ':
          return 'Número de cliente';
        case 'ENDE DELBENI':
          return 'Número de cliente';
        case 'ELFEC':
          return 'NUS:';
        case 'ENDE CORPORACIÓN':
          return 'Cuenta:';
        case 'SEPSA':
          return 'CI/NIT:';
        case 'CRE':
          return 'CI/NIT:';
        case 'SETAR':
          return 'CODIGO DE CLIENTE:';
        case 'EPSAS':
          return 'Recorrido:';
        case 'ELAPAS':
          return 'Código de usuario:';
        case 'SAGUAPAC':
          return 'Código Socio:';
        case 'COSAALT':
          return 'Nro. Registro o Cliente:';
        case 'SEMAPA':
          return 'Código de usuario:';
        case 'COOPLAN':
          return 'Código:';
        case 'COSAPCO':
          return 'Código:';
        case 'COOPAPPI':
          return 'Código:';
        case 'SAJUBA':
          return ':';
        case 'YPFB':
          return 'Usuario:';
        case 'EMTAGAS':
          return 'CODIGO CONTRATO:';
        case '':
          return 'Recorrido:';
        case 'ENTEL':
          return 'Télefono:';
        case 'GoLochTel':
          return 'Recorrido:';
        case 'Gestora Pública':
          return 'Digite el numero de documento:';
        case 'UMSA':
          return 'Documento de Identidad:';
        case 'UAGRM':
          return 'Documento de Identidad:';
        case 'SOAT UNIVida':
          return 'PLACA/CHASIS:';
        case 'Kantutani':
          return 'carnet de identidad:';
        case 'PagosNET':
          return 'CODIGO DE RECAUDACION:';
        case 'TUPPERWARE':
          return 'CUENTA:';
        case 'Yanbal':
          return 'cODIGO DE CONSULTO(A):';
        case 'Pólizas Propias':
          return ':';
        case 'Pólizas de terceros':
          return 'Nro. de Documento de Identidad:';
        case 'Vehiculos':
          return 'Placa PTA:';
        case 'INMUEBLES':
          return 'Identificador del inmueble:';
        case 'Infracciones':
          return 'Placa PTA:';
        default:
          return 'Cuenta'; // Valor por defecto si no coincide
      }
    }

    String? getLabelTextTwoByModule() {
      switch (widget.name.toUpperCase()) {
        /* case 'CESSA':
          return 'Nro. Cliente:';
        case 'DELAPAZ':
          return 'Número de cliente';
        case 'ENDE DELBENI':
          return 'Número de cliente';*/
        case 'ELFEC':
          return 'Nro. de cuenta:';
        case 'ELAPAS':
          return 'Nro. de cuenta:';
        case 'Gestora Pública':
          return 'Complemento CI:';
        case 'UMSA':
          return 'Tipo de Docuemnto(1=ci,2=cex, 3=pasaporte, 4= otros,5=nit):';
        case 'UAGRM':
          return 'Procedencia:';
        case 'SOAT UNIVida':
          return 'TELEFONO:';
        default:
          return null;
      }
    }

    String? getLabelTextthreeByModule() {
      switch (widget.name.toUpperCase()) {
        case 'Gestora Pública':
          return 'Número de formulario:';
        case 'SOAT UNIVida':
          return 'CORREO:';
        default:
          return null;
      }
    }

    String? getLabeldropByModule() {
      switch (widget.name.toUpperCase()) {
        case 'SEMAPA':
          return 'Tipo de Servicio:';
        case 'YPFB':
          return 'Departamento:';
        case 'SOAT UNIVida':
          return 'Residencia Vehiculo:';
        case 'INMUEBLES':
          return 'Gobierno Municipal:';
        default:
          return null;
      }
    }

    String? getLabeTextpByModule() {
      switch (widget.name.toUpperCase()) {
        case 'INMUEBLES':
          return 'Ingrese todos los datossolicitados y presione continuar: ';
        case 'Infracciones':
          return 'Verifique que los datos ingresados sean correctos y presione Continuar.';
        case 'Vehículos':
          return 'Verifique que los datos ingresados sean correctos y presione Continuar.';
        case 'Pólizas de terceros':
          return 'Ingrese el nro de docuemnto de identidad de la persona ejemplo: 123456LP';
        default:
          return null;
      }
    }

    final bool showDropdown = !_noDropdownModules.contains(
      widget.name.toUpperCase(),
    );
    final bool showFavorites = !_nofavoritesModules.contains(
      widget.name.toUpperCase(),
    );
    final bool showText = !_noTextModules.contains(widget.name.toUpperCase());
    final String? secondLabel = getLabelTextTwoByModule();
    final String? threeLabel = getLabelTextthreeByModule();
    final String? dropLabel = getLabeldropByModule();
    final String? textLabel = getLabeTextpByModule();

    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<SintesisObtainOperatingDebtBalanceBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            widget.name,
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description,
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              if (textLabel != null)
                Text(
                  textLabel,
                  style: AppTextStyles.mainStyleGreen14Bold(context),
                ),
              if (showDropdown)
                _buildDropdown1(
                  title: 'Tipo de búsqueda',
                  items: widget.res,
                  value: _selectedItem,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                  smallSpacing: smallSpacing,
                  top: topPadding,
                ),
              if (showText)
                Text(
                  'Datos de búsqueda:',
                  style: AppTextStyles.mainStyleGreen14Bold(context),
                ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: firstController,
                lbText: getLabelTextByModule(),
              ),
              if (secondLabel != null)
                TextFromFiel02(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  userController: secondController,
                  lbText: secondLabel,
                ),
              if (threeLabel != null)
                TextFromFiel02(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  userController: thirdController,
                  lbText: threeLabel,
                ),
              if (dropLabel != null)
                _buildDropdown(
                  title: dropLabel,
                  items: [],
                  value: _selectedValue,
                  onChanged: (newValue) {
                    setState(() => _selectedValue = newValue);
                  },
                  smallSpacing: smallSpacing,
                  top: topPadding,
                ),

              if (showFavorites)
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() => isChecked = value ?? false);
                      },
                    ),
                    Text(
                      'Agregar a favoritos',
                      style: AppTextStyles.mainStyleGreen14Bold(context),
                    ),
                  ],
                ),
              BlocBuilder<
                SintesisObtainOperatingDebtBalanceBloc,
                SintesisObtainOperatingDebtBalanceState
              >(
                builder: (context, state) {
                  if (state is SintesisObtainOperatingDebtBalanceSuccess) {
                    InjectorContainer.getIt<AppRouter>().push(
                      SintesisObtainOperatingDebtBalanceRoute(
                        name: widget.name,
                        colAccount: state
                            .sintesisObtainOperatingDebtBalance
                            .colAccounts,
                      ),
                    );
                  }
                  return Center(
                    child: Butoon1(
                      onTap: () {
                        List<String> params = [];
                        params.add(firstController.text);
                        if (secondLabel != null &&
                            secondController.text.isNotEmpty) {
                          params.add(secondController.text);
                        }
                        if (threeLabel != null &&
                            thirdController.text.isNotEmpty) {
                          params.add(thirdController.text);
                        }
                        context
                            .read<SintesisObtainOperatingDebtBalanceBloc>()
                            .add(
                              SintesisObtainOperatingDebtBalanEvent(
                                externalModule: '8', //widget.externalModule,
                                searchCriteria: '3',
                                //_selectedItem?.codeModule.toString() ?? '',
                                searchParameter: ['71299631'], //params,
                                externalModuleReference:
                                    _selectedItem?.moduleName ?? '',
                                favoriteName: '',
                                idCAI: '0',
                                idOffice: '0',
                                isFavorite: false,
                                isMobileAPP: true,
                                originType: '0',
                              ),
                            );
                      },
                      lblTextField: 'CONTINUAR',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown1({
    required String title,
    required List<SintesisGetSearchParametersByModuleEntity> items,
    required SintesisGetSearchParametersByModuleEntity? value,
    required Function(SintesisGetSearchParametersByModuleEntity) onChanged,
    double? smallSpacing,
    double? top,
  }) {
    return Card(
      elevation: smallSpacing! * 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.green),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: top! * 0.05),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<SintesisGetSearchParametersByModuleEntity>(
            isExpanded: true,
            hint: Text(
              title,
              style: AppTextStyles.mainStyleGreen14Bold(context),
            ),
            value: value,
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item.moduleName),
              );
            }).toList(),
            onChanged: (selected) => onChanged(selected!),
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
    required double top,
  }) {
    return Card(
      elevation: smallSpacing * 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.green),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: top * 0.05),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: value,
            hint: Text(
              title,
              style: AppTextStyles.mainStyleGreen14Bold(context),
            ),
            items: items.isNotEmpty
                ? items
                      .map(
                        (val) => DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        ),
                      )
                      .toList()
                : null,
            onChanged: items.isNotEmpty ? onChanged : null,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.green,
            ),
          ),
        ),
      ),
    );
  }
}
