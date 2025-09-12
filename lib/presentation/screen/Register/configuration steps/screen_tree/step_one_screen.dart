import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/presentation/screen/Register/configuration%20steps/screen_tree/scaner_screen.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StepOne extends StatefulWidget {
  const StepOne({
    super.key,
    required this.smallSpacing,
    required this.imgSize,
    required this.letterSize,
    required this.topPadding,
    required this.screenSize,
    required this.deviceName,
    required this.codigo,
  });

  final double smallSpacing;
  final double imgSize;
  final double letterSize;
  final double topPadding;
  final Size screenSize;
  final TextEditingController deviceName;
  final TextEditingController codigo;

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _telephoneCodeController =
      TextEditingController();
  FocusNode passWordFocus = FocusNode();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(widget.topPadding * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1.- Debe ingresar un nombre que identifique a su dispositivo (Ej. Mi telefono)',
                style: AppTextStyles.mainStyleGreen16Bold(context),
                textAlign: TextAlign.center,
              ),
              TextFromFiel01(
                screenSize: widget.screenSize,
                smallSpacing: widget.smallSpacing,
                userController: widget.deviceName,
                lbText: 'Nombre del dispositivo',
              ),
              SizedBox(height: widget.screenSize.height * 0.02),
              Text(
                '2.- Puede activar el dispositivo en cualquiera de nuestros cajeros automaticos.',
                style: AppTextStyles.mainStyleGreen16Bold(context),
                textAlign: TextAlign.center,
              ),
              Center(
                child: SizedBox(
                  width: widget.screenSize.width * 0.8,
                  height: widget.screenSize.height * 0.05,
                  child: Card(
                    elevation: widget.smallSpacing * 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.green,
                        ),
                        borderRadius: BorderRadius.all(radiusCircular(11)),
                      ),
                      child: TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          hintText: "Mantén pulsado para pegar",
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.qr_code_scanner_sharp,
                              color: Theme.of(context).colorScheme.green,
                              size: widget.smallSpacing * 1,
                            ),

                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ScannerScreen(),
                                ),
                              );
                              if (result != null && result is String) {
                                _addressController.text = result;
                              }
                            },
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          hintStyle: AppTextStyles.mainStyleGreen16(context),
                          filled: true,
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: widget.screenSize.height * 0.02),
              Text(
                '3.- Ingrese el codigo que le llego al correo',
                style: AppTextStyles.mainStyleGreen16Bold(context),
                textAlign: TextAlign.center,
              ),
              TextFromFiel01(
                screenSize: widget.screenSize,
                smallSpacing: widget.smallSpacing,
                userController: _postalCodeController,
                lbText: 'Codigo ',
              ),
              SizedBox(height: widget.screenSize.height * 0.02),
              Text(
                '4.- Ingrese el codigo que le llego al su numero',
                style: AppTextStyles.mainStyleGreen16Bold(context),
                textAlign: TextAlign.center,
              ),
              TextFromFiel01(
                screenSize: widget.screenSize,
                smallSpacing: widget.smallSpacing,
                userController: _telephoneCodeController,
                lbText: 'Codigo ',
              ),
              SizedBox(height: widget.screenSize.height * 0.02),
              Center(
                child: SizedBox(
                  width: widget.screenSize.width * 0.5,
                  child: Card(
                    elevation: widget.smallSpacing * 0.5,
                    child: Butoon1(onTap: () {}, lblTextField: 'Continuar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
