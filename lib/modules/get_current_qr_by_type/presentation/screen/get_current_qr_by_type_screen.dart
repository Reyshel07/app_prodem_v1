import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/presentation/bloc/get_current_qr_by_type_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:app_prodem_v1/utils/utils_fiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CurrentQrByTypeScreen extends StatelessWidget {
  const CurrentQrByTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return BlocProvider(
      create: (context) => InjectorContainer.getIt<GetCurrentQrByTypeBloc>(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Depósito desde otras Entidades',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<GetCurrentQrByTypeBloc>()
                ..add(GetCurrentQrEvent()),
          child: BlocBuilder<GetCurrentQrByTypeBloc, GetCurrentQrByTypeState>(
            builder: (context, state) {
              if (state is GetCurrentQrByTypeSuccess) {
                final res = state.getCurrentQrByTypeResponseEntity;
                final data = res.data.mensajeQr;
                final result = parseData(data);
                return Padding(
                  padding: EdgeInsets.all(topPadding * 0.05),
                  child: Column(
                    children: [
                      Text(
                        result.toString(),
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                      Image.network(
                        res.data.qr,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 100,
                            color: Colors.grey,
                          );
                        },
                      ),
                      /*Card(
                        elevation: smallSpacing * 0.5,
                        child: QrImageView(
                          data: qr.toString(),
                          version: QrVersions.auto,
                          size: screenSize.height * 0.35,
                          backgroundColor: Colors.white,
                        ),
                      ),*/
                      Card(
                        elevation: smallSpacing * 0.5,
                        child: SizedBox(
                          width: screenSize.width * 0.4,
                          child: ButoonIcon1(
                            icon: Icons.share,
                            onTap: () {},
                            lblTextField: 'Descargar QR',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
