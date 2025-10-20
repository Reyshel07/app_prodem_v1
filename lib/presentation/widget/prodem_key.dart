import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_prodem_v1/utils/text.dart';

class ProdemKeySection extends StatelessWidget {
  final VoidCallback onConfirm; // 👈 se pasa desde afuera
  final double smallSpacing;
  final Size screenSize;

  const ProdemKeySection({
    super.key,
    required this.onConfirm,
    required this.smallSpacing,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePrKeyBloc, CreatePrKeyState>(
      listener: (context, createState) {
        if (createState is CreatePrKeySuccess) {
          context.read<GetPrKeyByIdBloc>().add(
            GetPrKeyEvent(
              idSmsOperation: createState.createProdemKeyResponseEntity.data
                  .toString(),
            ),
          );
        }
      },
      builder: (context, createState) {
        return BlocBuilder<GetPrKeyByIdBloc, GetPrKeyByIdState>(
          builder: (context, getState) {
            return Column(
              children: [
                if (getState is GetPrKeyByIdSuccess)
                  Text(
                    getState.getProdemKeyByIdResponseEntity?.data ?? '---',
                    style: AppTextStyles.mainStyleGreen18Bold(context),
                  )
                else
                  Text(
                    'CÓDIGO PRODEM',
                    style: AppTextStyles.mainStyleGreen18Bold(context),
                  ),
                SizedBox(height: smallSpacing * 0.5),

                // 🟢 Botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (createState is CreatePrKeyLoading)
                      const CircularProgressIndicator(),

                    if (createState is! CreatePrKeySuccess &&
                        createState is! CreatePrKeyLoading)
                      Butoon1(
                        onTap: () {
                          context.read<CreatePrKeyBloc>().add(
                            CreatePrKeyEvent1(),
                          );
                        },
                        lblTextField: 'OBTENER CÓDIGO',
                      ),

                    if (createState is CreatePrKeySuccess &&
                        getState is GetPrKeyByIdSuccess)
                      Butoon1(
                        onTap: onConfirm, // 👈 aquí se llama al callback
                        lblTextField: 'CONFIRMAR',
                      ),

                    Butoon1(onTap: () {}, lblTextField: 'CANCELAR'),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
