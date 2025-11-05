import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/get_paf_data_for_mobile_app/presentation/bloc/get_paf_data_for_mobile_app_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GetPafSataForMobileAppScreen extends StatelessWidget {
  const GetPafSataForMobileAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetPafDataForMobileAppBloc>(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Solicitud de fianzas Bancarias',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              GetPafDataForMobileAppBloc,
              GetPafDataForMobileAppState
            >(
              builder: (context, state) {
                return Column(children: [
            
                    ],
                  );
              },
            ),
      ),
    );
  }
}
