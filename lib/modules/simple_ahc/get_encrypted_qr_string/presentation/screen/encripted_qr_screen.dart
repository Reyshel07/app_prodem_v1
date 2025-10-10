import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../domain/entities/entity.dart';

@RoutePage()
// ignore: must_be_immutable
class EncriptedQRScreen extends StatelessWidget {
  final GetEncryptedQrStringEntity getEncryptedQrStringEntity;
  String moneda;
  String monto;
  String referencia;
  EncriptedQRScreen({
    super.key,
    required this.getEncryptedQrStringEntity,
    required this.moneda,
    required this.monto,
    required this.referencia,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.white,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text(
          'Cobro QR PRODEM',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'COBRO MEDIANTE CÓDIGO QR:',
              style: AppTextStyles.mainStyleGreen18Bold(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: smallSpacing * 0.5),
            Card(
              elevation: smallSpacing * 0.5,
              child: QrImageView(
                data: getEncryptedQrStringEntity.qrValue,
                version: QrVersions.auto,
                size: screenSize.height * 0.35,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: smallSpacing * 0.5),
            Text(
              '$moneda: $monto\n'
              'Referencia: $referencia',
              style: AppTextStyles.mainStyleGreen10Bold(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: smallSpacing * 0.5),
            Text(
              'EL QR GENERADO ES EXCLUSIVO PARA USO ENTRE CUENTAS PRODEM.',
              style: AppTextStyles.mainStyleGreen18Bold(context),
            ),
            Card(
              elevation: smallSpacing * 0.5,
              child: SizedBox(
                width: screenSize.width * 0.4,
                child: ButoonIcon1(
                  icon: Icons.share,
                  onTap: () {},
                  lblTextField: 'Compartir QR',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
