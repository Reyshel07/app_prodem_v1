/*import 'package:app_prodem_v1/config/router/router.dart';
import 'package:flutter/material.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

@RoutePage()
class SavingAccountTransMobileEndScreen extends StatelessWidget {
  const SavingAccountTransMobileEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<SavingAccountTransferMobileBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Comprobante de Transacción")),
        body:
            BlocBuilder<
              SavingAccountTransferMobileBloc,
              SavingAccountTransferMobileState
            >(
              builder: (context, state) {
                if (state is SavingAccountTransferMobileLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is SavingAccountTransferMobileSuccess) {
                  final data = state.data;
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('')],
                    ),
                  );
                }

                if (state is SavingAccountTransferMobiletaError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                return const Center(
                  child: Text("Esperando resultado de la transferencia..."),
                );
              },
            ),
      ),
    );
  }
}*/
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/entity.dart';

@RoutePage()
class SavingAccountTransMobileEndScreen extends StatelessWidget {
  final SavingsAccountTransferMobileResponseEntity response;

  const SavingAccountTransMobileEndScreen({super.key, required this.response});

  Map<String, String> _parseData(String rawData) {
    final Map<String, String> parsed = {};
    final parts = rawData.split("|");
    for (var part in parts) {
      if (part.trim().isEmpty) continue;
      final keyValue = part.split(": &");
      if (keyValue.length == 2) {
        parsed[keyValue[0].trim()] = keyValue[1].trim();
      }
    }
    return parsed;
  }

  @override
  Widget build(BuildContext context) {
    final data = _parseData(response.data);
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Theme.of(context).colorScheme.white,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text(
          'Transferencia entre cuentas propias',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.06),
        child: Column(
          children: [
            Text(
              'COMPROBANTE DE TRANSFERENCIA ENTRE CUENTAS\nLA TRANSACCIÓN SE REALIZÓ CON ÉXITO!!',
              style: AppTextStyles.mainStyleGreen16Bold(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: smallSpacing * 0.5),
            SizedBox(
              height: screenSize.height * 0.27,
              child: ListView(
                children: data.entries.map((entry) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${entry.key}: ",
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                      Text(
                        entry.value,
                        style: AppTextStyles.mainStyleGreen14(context),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenSize.width * 0.4,
                  child: Card(
                    elevation: smallSpacing * 0.5,
                    child: ButoonIcon1(
                      onTap: () {},
                      lblTextField: 'COMPARTIR',
                      icon: Icons.share,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.3,
                  child: Card(
                    elevation: smallSpacing * 0.5,
                    child: ButoonIcon1(
                      onTap: () {
                        InjectorContainer.getIt<AppRouter>().push(HomeRoute());
                      },
                      lblTextField: 'SALIR',
                      icon: Icons.power_settings_new,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
