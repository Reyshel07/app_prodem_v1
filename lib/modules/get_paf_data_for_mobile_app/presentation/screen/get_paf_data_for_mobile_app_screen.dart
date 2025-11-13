import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/get_paf_data_for_mobile_app/presentation/bloc/get_paf_data_for_mobile_app_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GetPafDataForMobileAppScreen extends StatelessWidget {
  const GetPafDataForMobileAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetPafDataForMobileAppBloc>()
            ..add(GetPafDataForMobileApEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Puntos de Atencion',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              GetPafDataForMobileAppBloc,
              GetPafDataForMobileAppState
            >(
              builder: (context, state) {
                if (state is GetPafDataForMobileAppLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is GetPafDataForMobileAppError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                /* if (state is GetPafDataForMobileAppSuccess) {
                  final List<GetPafDataForMobileAppEntity> points =
                      state.getPafDataForMobileAppResponseEntity.data;
                  return Expanded(child: MapProviderWidget(points: points));
                }*/
                return const SizedBox.shrink();
              },
            ),
      ),
    );
  }
}
