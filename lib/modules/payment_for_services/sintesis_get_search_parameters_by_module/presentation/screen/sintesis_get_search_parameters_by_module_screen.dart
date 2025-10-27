import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/domain/entities/sintesis_get_search_parameters_by_module_entity.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';

/*@RoutePage()
class SintesisGetSearchParametersByModuleScreen extends StatefulWidget {
  final String name;
  final String description;
  final List<SintesisGetSearchParametersByModuleEntity> data;
  const SintesisGetSearchParametersByModuleScreen({
    super.key,
    required this.data,
    required this.name,
    required this.description,
  });

  @override
  State<SintesisGetSearchParametersByModuleScreen> createState() =>
      _SintesisGetSearchParametersByModuleScreenState();
}

class _SintesisGetSearchParametersByModuleScreenState
    extends State<SintesisGetSearchParametersByModuleScreen> {
  String? _selectedValueMoney;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
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
            Text(
              widget.description,
              style: AppTextStyles.mainStyleGreen18Bold(context),
            ),
            _buildDropdown(
              title: 'Tipo de búsqueda:',
              items: [],
              value: _selectedValueMoney,
              onChanged: (newValue) {
                setState(() => _selectedValueMoney = newValue);
              },
              smallSpacing: smallSpacing,
            ),
          ],
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
*/

@RoutePage()
class SintesisGetSearchParametersByModuleScreen extends StatefulWidget {
  final String name;
  final String description;
  final List<SintesisGetSearchParametersByModuleEntity> data;
  const SintesisGetSearchParametersByModuleScreen({
    super.key,
    required this.data,
    required this.name,
    required this.description,
  });

  @override
  State<SintesisGetSearchParametersByModuleScreen> createState() =>
      _SintesisGetSearchParametersByModuleScreenState();
}

class _SintesisGetSearchParametersByModuleScreenState
    extends State<SintesisGetSearchParametersByModuleScreen> {
  String? _selectedValueMoney;
  final TextEditingController amountToSendController = TextEditingController(
    text: '117',
  );
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    Widget content;
    switch (widget.name.toUpperCase()) {
      case 'SEMAPA':
        content = _buildSemapaForm(smallSpacing, screenSize, topPadding);
        break;
      case 'DELAPAZ':
        content = _buildDelapazForm();
        break;
      case 'ENDE DELBENI':
        content = _buildEndeDelBeniForm();
        break;
      case 'ELFEC':
        content = _buildElfecForm();
        break;
      case 'ENDE CORPORACIÓN':
        content = _buildEndeCorporacionForm();
        break;
      case 'SEPSA':
        content = _buildSepsaForm();
        break;
      case 'CRE':
        content = _buildCreForm();
        break;
      case 'SETAR':
        content = _buildSetarForm();
        break;
      case 'EPSAS':
        content = _buildEpsasForm();
        break;
      case 'ELAPAS':
        content = _buildElapasForm();
        break;
      case 'SAFUAPAC':
        content = _buildSafuapacForm();
        break;
      case 'COSAPCO':
        content = _buildCosapcoForm();
        break;
      case 'COOPAPPI':
        content = _buildCoopappiForm();
        break;
      case 'SAJUBA':
        content = _buildSajubaForm();
        break;
      case 'YPFB':
        content = _buildYpfbForm();
        break;
      case 'EMTAGAS':
        content = _buildEmtagasForm();
        break;
      case 'ENTEL':
        content = _buildEntelForm();
        break;
      case 'GOLOCHTEL':
        content = _buildGolochtelForm();
        break;
      case 'GESTORA PUBLICA':
        content = _buildGestoraPublicaForm();
        break;
      case 'UMAS':
        content = _buildUmasForm();
        break;
      case 'UAGRM':
        content = _buildUagrmForm();
        break;
      case 'SOAT UNIVIDA':
        content = _buildSoatUnividaForm();
        break;
      case 'KANTUTANI':
        content = _buildKantutaniForm();
        break;
      case 'PAGOSNET':
        content = _buildPagosnetForm();
        break;
      case 'TUPPERWARE':
        content = _buildTupperwareForm();
        break;
      case 'YANBAL':
        content = _buildYanbalForm();
        break;
      case 'PÓLIZAS PROPIAS':
        content = _buildPolizasPropiasForm();
        break;
      case 'PÓLIZAS DE TERCEROS':
        content = _buildPolizasTercerosForm();
        break;
      case 'VEHICULOS':
        content = _buildVehiculosForm();
        break;
      case 'INMUEBLES':
        content = _buildInmueblesForm();
        break;
      case 'INFRACCIONES':
        content = _buildInfraccionesForm();
        break;
      case 'CESSA':
        content = _buildInCessaForm();
        break;
      default:
        content = const Center(child: Text('Servicio no reconocido'));
    }

    return Scaffold(
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
        child: content,
      ),
    );
  }

  ///Semapa
  Widget _buildSemapaForm(double small, Size screenSIZE, double top) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
        _buildDropdown(
          title: 'MONEDA TRANSFERENCIA',
          items: [],
          value: _selectedValueMoney,
          onChanged: (newValue) {
            setState(() => _selectedValueMoney = newValue);
          },
          smallSpacing: small,
          top: top,
        ),
        TextFromFiel02(
          screenSize: screenSIZE,
          smallSpacing: small,
          userController: amountToSendController,
          lbText: 'Monto a enviar:',
        ),
        _buildDropdown(
          title: 'MONEDA TRANSFERENCIA',
          items: [],
          value: _selectedValueMoney,
          onChanged: (newValue) {
            setState(() => _selectedValueMoney = newValue);
          },
          smallSpacing: small,
          top: top,
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
              'TAgregar a favoritos',
              style: AppTextStyles.mainStyleGreen14Bold(context),
            ),
          ],
        ),
        Butoon1(onTap: () {}, lblTextField: 'CONTINUAR'),
      ],
    );
  }

  ///ELFEC
  Widget _buildElfecForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///DELAPAZ
  Widget _buildDelapazForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  /// ENDECOORPORACION
  Widget _buildEndeCorporacionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///SEPSA
  Widget _buildSepsaForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///CRE
  Widget _buildCreForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///SETAR
  Widget _buildSetarForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///ENDEDELBENI
  Widget _buildEndeDelBeniForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///EPSAS
  Widget _buildEpsasForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  //ELAPAS
  Widget _buildElapasForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///SAFUAPAC
  Widget _buildSafuapacForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///COSAPCO
  Widget _buildCosapcoForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///COOPAPPI
  Widget _buildCoopappiForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///SAJUBA
  Widget _buildSajubaForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///YPFB
  Widget _buildYpfbForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///EMTAGAS
  Widget _buildEmtagasForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///ENTEL
  Widget _buildEntelForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///GOLOCH
  Widget _buildGolochtelForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///GESTORA
  Widget _buildGestoraPublicaForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///UMAS
  Widget _buildUmasForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///UAGRM
  Widget _buildUagrmForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///SOATUNIVIDA
  Widget _buildSoatUnividaForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///KANTUTANI
  Widget _buildKantutaniForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///PAGOSNET
  Widget _buildPagosnetForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///TUPPERWARE
  Widget _buildTupperwareForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///YANBAL
  Widget _buildYanbalForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///POLIZA
  Widget _buildPolizasPropiasForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///PLIZATERCEROS
  Widget _buildPolizasTercerosForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///VEHICULOS
  Widget _buildVehiculosForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///INMUEBLES
  Widget _buildInmueblesForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///INFRACCIONES
  Widget _buildInfraccionesForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
    );
  }

  ///CESSA
  Widget _buildInCessaForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: AppTextStyles.mainStyleGreen18Bold(context),
        ),
      ],
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
    return Padding(
      padding: EdgeInsets.only(top: smallSpacing),
      child: Card(
        elevation: smallSpacing * 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Theme.of(context).colorScheme.green),
        ),
        child: Padding(
          padding: EdgeInsets.all(top * 0.05),
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
      ),
    );
  }
}
