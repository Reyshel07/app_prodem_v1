import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/entity.dart';

@RoutePage()
class InforAccionesTwoScreen extends StatelessWidget {
  final List<InforAccionesEntity> data;
  final String tipo;
  const InforAccionesTwoScreen({
    super.key,
    required this.data,
    required this.tipo,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    /// ✅ Filtrar por nombre de grupo según el JSON real
    final renovacion = data.where((e) => e.grupo == 'Renovación').toList();
    final nuevoDpf = data.where((e) => e.grupo == 'Nuevo DPF').toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'ProdemMóvil',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Theme.of(context).colorScheme.green,
              labelColor: Theme.of(context).colorScheme.green,
              unselectedLabelColor: Theme.of(context).colorScheme.green,
              tabs: const [
                Tab(text: 'Renovación'),
                Tab(text: 'Nuevo DPF'),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  // ✅ Lista de Renovación
                  ListView.builder(
                    itemCount: renovacion.length,
                    itemBuilder: (context, index) {
                      final res = renovacion[index];
                      return cardItem(context, res, topPadding, smallSpacing);
                    },
                  ),

                  // ✅ Lista de Nuevo DPF
                  ListView.builder(
                    itemCount: nuevoDpf.length,
                    itemBuilder: (context, index) {
                      final res = nuevoDpf[index];
                      return cardItem(context, res, topPadding, smallSpacing);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardItem(
    BuildContext context,
    InforAccionesEntity res,
    double topPadding,
    double smallSpacing,
  ) {
    return Card(
      elevation: smallSpacing * 0.5,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.green),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                res.tipo,
                style: AppTextStyles.mainStyleGreen16Bold(context),
              ),
              SizedBox(height: smallSpacing * 0.5),
              Text(
                res.info,
                style: AppTextStyles.mainStyleGreen14(context),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: smallSpacing * 0.5),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Aceptar',
                  style: AppTextStyles.mainStyleGreen14Bold(context),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
