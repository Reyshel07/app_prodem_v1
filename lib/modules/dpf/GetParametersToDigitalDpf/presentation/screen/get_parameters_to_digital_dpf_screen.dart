import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/presentation/bloc/get_parameters_to_digital_dpf_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ParametersToDigitalDpfScreen extends StatelessWidget {
  const ParametersToDigitalDpfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetParametersToDigitalDpfBloc>()
            ..add(GetParametersToDigDpfEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'SOLICITUD DE DPF EN LÍNEA',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              GetParametersToDigitalDpfBloc,
              GetParametersToDigitalDpfState
            >(
              builder: (context, state) {
                return Column(children: [Text('NUEVA SOLICITUD DE DPF')]);
              },
            ),
      ),
    );
  }
}
