import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/presentation/screen/Register/account_settings_screen.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';

class VirtuellesTicketScreen extends StatelessWidget {
  static const path = '/VirtuellesTicketScreen';
  static const name = 'VirtuellesTicketScreen';
  const VirtuellesTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.green,
        foregroundColor: Theme.of(context).colorScheme.white,
        title: Text(
          'RESERVA DE TICKET VIRTUAL',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RESERVA DE TICKET VIRTUAL PARA AGENCIA',
              style: AppTextStyles.mainStyleGreen16Bold(context),
            ),
            DrowpButoon1(screenSize: screenSize, smallSpacing: smallSpacing),
            DrowpButoon1(screenSize: screenSize, smallSpacing: smallSpacing),
            Text(
              'Dia de la reserva:',
              style: AppTextStyles.mainStyleGreen16Bold(context),
            ),
            Row(
              children: [Icon(Icons.circle_outlined), Text('Hoy 12/09/2025')],
            ),
            Row(
              children: [Icon(Icons.circle_outlined), Text('Hoy 12/09/2025')],
            ),
            DrowpButoon1(screenSize: screenSize, smallSpacing: smallSpacing),
            SizedBox(
              width: screenSize.width * 0.5,
              child: Card(
                elevation: smallSpacing * 0.5,
                child: Butoon1(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountSettingsScreen(),
                      ),
                    );
                  },
                  lblTextField: 'RESERVAR',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
