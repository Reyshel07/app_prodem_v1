import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/referenced/charge_references/presentation/bloc/charge_references_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ChargeReferencesScreen extends StatelessWidget {
  const ChargeReferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<ChargeReferencesBloc>()
            ..add(ChargeRefEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Referenciados',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Builder(
          builder: (newContext) {
            final chargeReferencesBloc = newContext
                .read<ChargeReferencesBloc>();
            return Padding(
              padding: EdgeInsets.all(topPadding * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Butoon1(
                        onTap: () {
                          InjectorContainer.getIt<AppRouter>().push(
                            InsertWebReferencesRoute(
                              chargeReferencesBloc: chargeReferencesBloc,
                            ),
                          );
                        },
                        lblTextField: 'REGISTRAR NUEVO',
                      ),
                    ),
                    SizedBox(height: smallSpacing * 0.5),
                    BlocConsumer<ChargeReferencesBloc, ChargeReferencesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is ChargeReferencesSuccess) {
                          final res = state
                              .chargeReferencesResponseEntity
                              .data
                              .colReferences;
                          return Column(
                            children: [
                              Text(
                                'Detalle Referenciados',
                                style: AppTextStyles.mainStyleGreen16Bold(
                                  context,
                                ),
                              ),
                              SizedBox(height: smallSpacing * 0.5),
                              ListView.builder(
                                itemCount: res.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
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
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          topPadding * 0.05,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: screenSize.width * 0.26,
                                              child: Text(
                                                'Nombre:\n'
                                                'Identificación:\n'
                                                'Télefono:\n'
                                                'Producto:\n'
                                                'Parentesco:\n'
                                                'Monto:',
                                                style:
                                                    AppTextStyles.mainStyleGreen14Bold(
                                                      context,
                                                    ),
                                              ),
                                            ),
                                            Text(
                                              '${data.fullName}\n'
                                              '${data.identityCardNumber}\n'
                                              '${data.cellPhoneNumber}\n'
                                              '${data.productName}\n'
                                              '${data.kinship}\n'
                                              '${data.ammount}',
                                              style:
                                                  AppTextStyles.mainStyleGreen14(
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
                        }
                        return Center(child: CircularProgressIndicator());
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
}
