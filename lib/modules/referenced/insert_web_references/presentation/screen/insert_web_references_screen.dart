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
import 'package:nb_utils/nb_utils.dart';

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
    text: '3061495151',
  );
  String? _selectedValueColTypes;
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
          child: Column(
            children: [
              Text(
                'Nuevo Referenciado',
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              BlocConsumer<ChargeReferencesBloc, ChargeReferencesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ChargeReferencesSuccess) {
                    final res =
                        state.chargeReferencesResponseEntity.data.colMoneys;
                    final nombre = res.map((name) => name.nombre).toList();
                    return _buildDropdown(
                      title: 'Producto',
                      items: nombre,
                      value: _selectedValueColTypes,
                      onChanged: (newValue) {
                        setState(() => _selectedValueColTypes = newValue);
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
                userController: nameController,
                lbText: 'Nombre',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: nameController,
                lbText: 'Nro. Documento',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: nameController,
                lbText: 'Complemento',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: nameController,
                lbText: 'Telefono/Celular',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: nameController,
                lbText: 'Parentesco',
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Butoon1(onTap: () {}, lblTextField: 'CANCELAR'),
                  Butoon1(onTap: () {}, lblTextField: 'GUARDAR'),
                ],
              ),
            ],
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
