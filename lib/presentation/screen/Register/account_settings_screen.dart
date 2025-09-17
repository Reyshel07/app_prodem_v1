import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/presentation/screen/Register/configuration%20steps/configuration_steps_screen.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final TextEditingController responseController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController maximumAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    //final double containerSize = screenSize.height * 0.3;
    //final double imgSize = screenSize.width * 0.4;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text(
          'Bienvenido a Banco Prodem S.A.',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(topPadding * 0.05),
            child: Column(
              children: [
                Text(
                  'Configuracion iniciaL de la cuenta',
                  style: AppTextStyles.mainStyleGreen16Bold(context),
                ),
                Text(
                  'No puede repetir un Usuario registrado anteriosmente.\n'
                  'No puede contener ninguno de sus nombres, apellidos ni iniciales.',
                  style: AppTextStyles.mainStyleGreen12(context),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Nuevo Usuario:',
                  style: AppTextStyles.mainStyleGreen16Bold(context),
                ),
                TextFromFiel01(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  userController: userController,
                  lbText: 'Nuevo Usuario',
                ),
                Text(
                  'Debe registrar una contraseña entre 6 a 15 caracteres\n'
                  'Que contenga minuscula Mayusculas y Numeros:',
                  style: AppTextStyles.mainStyleGreen12(context),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Contraseñsa:',
                  style: AppTextStyles.mainStyleGreen16Bold(context),
                ),
                TextFromFiel01(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  userController: passwordController,
                  lbText: 'Contraseña',
                ),
                Text(
                  'Redigite su Contraseñsa:',
                  style: AppTextStyles.mainStyleGreen16Bold(context),
                ),
                TextFromFiel01(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  userController: password2Controller,
                  lbText: 'Redigite su contraseña',
                ),
                Text(
                  'Pregunta secreta:',
                  style: AppTextStyles.mainStyleGreen16Bold(context),
                ),
                DrowpButoon1(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                ),
                Text(
                  'Respuesta:',
                  style: AppTextStyles.mainStyleGreen16Bold(context),
                ),
                TextFromFiel01(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  userController: responseController,
                  lbText: 'Respuesta',
                ),
                Text(
                  'Ingrese su correo electronico',
                  style: AppTextStyles.mainStyleGreen16Bold(context),
                  textAlign: TextAlign.center,
                ),
                TextFromFiel01(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  userController: emailController,
                  lbText: 'Correo Electronico ',
                ),
                Text(
                  'Ingrese el monto maximo',
                  style: AppTextStyles.mainStyleGreen16Bold(context),
                  textAlign: TextAlign.center,
                ),
                DrowpButoon1(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                ),
                SizedBox(
                  width: screenSize.width * 0.5,
                  child: Card(
                    elevation: smallSpacing * 0.5,
                    child: Butoon1(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfigurationStepsScreen(),
                          ),
                        );
                      },
                      lblTextField: 'Continuar',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrowpButoon1 extends StatelessWidget {
  const DrowpButoon1({
    super.key,
    required this.screenSize,
    required this.smallSpacing,
  });

  final Size screenSize;
  final double smallSpacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.8,
      height: screenSize.height * 0.05,
      child: Card(
        elevation: smallSpacing * 0.5,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.green),
            borderRadius: BorderRadius.all(radiusCircular(11)),
          ),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.transparente,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 11,
                //vertical: 1,
              ),
            ),
            value: null,
            hint: Text(
              'Selecciona una opción',
              style: AppTextStyles.mainStyleGreen14(context),
            ),
            items: [
              DropdownMenuItem(
                value: 'opcion1',
                child: Text(
                  'Opción 1',
                  style: AppTextStyles.mainStyleGreen14(context),
                ),
              ),
              DropdownMenuItem(
                value: 'opcion2',
                child: Text(
                  'Opción 2',
                  style: AppTextStyles.mainStyleGreen14(context),
                ),
              ),
              DropdownMenuItem(
                value: 'opcion3',
                child: Text(
                  'Opción 3',
                  style: AppTextStyles.mainStyleGreen14(context),
                ),
              ),
            ],
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
