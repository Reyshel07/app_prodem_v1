import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/presentation/bloc/theme_provider.dart';
import 'package:app_prodem_v1/modules/home/settings_screen.dart/virtuelles%20Ticket/virtuelles_ticket_screen.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/container02_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:app_prodem_v1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height * 0.3),
        child: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          flexibleSpace: Container(
            height: screenSize.height * 0.4,
            width: screenSize.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.blue,
                  Theme.of(context).colorScheme.green,
                ],
                stops: [0.00, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  AssetImageApp.getIsotipo,
                  height: screenSize.height * 0.09,
                ),
                Text(
                  'jade rashel piza quispe\n'
                  'version: 17.4\n'
                  'monto limite diarios',
                  style: AppTextStyles.mainStyleWhite16(context),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(topPadding * 0.09),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Ingresar con huella',
                  style: AppTextStyles.mainStyleGreen14Bold(context),
                ),
                Spacer(),
                Icon(Icons.fingerprint),
              ],
            ),
          ),
          ListTitle1(
            letterSize: letterSize,
            smallSpacing: smallSpacing,
            onTap1: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Tickets virtuales',
                      style: AppTextStyles.mainStyleGreen18Bold(context),
                    ),
                    content: SizedBox(
                      width: screenSize.width * 0.5,
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Butoon1(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtuellesTicketScreen(),
                              ),
                            );
                          },
                          lblTextField: 'Solicitar ticket',
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            lblTextField: 'Ticket Virtual',
            icon: Icons.confirmation_number,
          ),
          ListTitle1(
            letterSize: letterSize,
            smallSpacing: smallSpacing,
            onTap1: () {},
            lblTextField: 'Puntos de Atencion',
            icon: Icons.location_on,
          ),
          ListTitle1(
            letterSize: letterSize,
            smallSpacing: smallSpacing,
            onTap1: () {},
            lblTextField: 'Configuracion',
            icon: Icons.settings,
          ),
          ListTitle1(
            letterSize: letterSize,
            smallSpacing: smallSpacing,
            onTap1: () {
              themeProvider.changeTheme();
            },
            lblTextField: 'Cambiar tema',
            icon: themeProvider.isDark ? Icons.light_mode : Icons.dark_mode,
          ),
          ListTitle1(
            smallSpacing: smallSpacing,
            letterSize: letterSize,
            onTap1: () {},
            lblTextField: 'Salir',
            icon: Icons.power_settings_new,
          ),
        ],
      ),
    );
  }
}
