import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class AdministracionScreen extends StatelessWidget {
  const AdministracionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.white,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text(
          'ProdemMóvil',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Seleccione una opción',
              style: AppTextStyles.mainStyleGreen18Bold(context),
            ),
            SizedBox(height: smallSpacing * 0.5),
            GestureDetector(
              onTap: () {
                InjectorContainer.getIt<AppRouter>().push(InforAccionesRoute());
              },
              child: Card(
                elevation: smallSpacing * 0.5,
                child: Container(
                  height: screenSize.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.green,
                    ),
                    color: Theme.of(context).colorScheme.green,
                    borderRadius: BorderRadius.all(radiusCircular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: smallSpacing * 5,
                        color: Theme.of(context).colorScheme.white,
                      ),
                      Text(
                        'Renovación',
                        style: AppTextStyles.mainStyleWhite18Bold(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: smallSpacing * 0.5),
            GestureDetector(
              onTap: () {
                InjectorContainer.getIt<AppRouter>().push(InforAccionesRoute());
              },
              child: Card(
                elevation: smallSpacing * 0.5,
                child: Container(
                  height: screenSize.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.red,
                    ),
                    color: Theme.of(context).colorScheme.red,
                    borderRadius: BorderRadius.all(radiusCircular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.transfer_within_a_station_outlined,
                        size: smallSpacing * 5,
                        color: Theme.of(context).colorScheme.white,
                      ),
                      Text(
                        'Cancelación',
                        style: AppTextStyles.mainStyleWhite18Bold(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
