import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/lightning%20turn/GetProdemExpressSolicitationWeb/presentation/bloc/pr_express_solicitation_web_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';

@RoutePage()
class PrExpressSolicitationWebScreen extends StatelessWidget {
  final List<PrExpressSolicitationWebEntity> data;
  const PrExpressSolicitationWebScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<PrExpressSolicitationWebBloc>(),
      child: Scaffold(
        body:
            BlocBuilder<
              PrExpressSolicitationWebBloc,
              PrExpressSolicitationWebState
            >(
              builder: (context, state) {
                return Column();
              },
            ),
      ),
    );
  }
}
