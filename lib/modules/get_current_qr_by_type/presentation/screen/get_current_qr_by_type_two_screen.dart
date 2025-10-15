import 'dart:io';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:app_prodem_v1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CurrentQrByTypeTwoScreen extends StatefulWidget {
  String nameDepo;
  String cuentaPro;
  String cuenta;
  String monto;
  String moneda;
  String oriFon;
  String desFon;
  String bancoOri;
  String cuentaOri;
  String fechaDepo;
  CurrentQrByTypeTwoScreen({
    super.key,
    required this.bancoOri,
    required this.cuenta,
    required this.cuentaOri,
    required this.cuentaPro,
    required this.desFon,
    required this.fechaDepo,
    required this.moneda,
    required this.monto,
    required this.nameDepo,
    required this.oriFon,
  });

  @override
  State<CurrentQrByTypeTwoScreen> createState() =>
      _CurrentQrByTypeTwoScreenState();
}

class _CurrentQrByTypeTwoScreenState extends State<CurrentQrByTypeTwoScreen> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? xfile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (xfile != null) {
      setState(() {
        _pickedImage = File(xfile.path);
      });
    }
  }

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
          'Nuevo Depósito desde otras Entitdades',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.4,
              width: screenSize.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: _pickedImage != null
                  ? Image.file(
                      _pickedImage!,
                      width: double.infinity,
                      height: screenSize.height * 0.28,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      AssetImageApp.getComprobante,
                      width: double.infinity,
                      height: screenSize.height * 0.28,
                      fit: BoxFit.fill,
                    ),
            ),
            SizedBox(height: smallSpacing * 0.5),
            Text(
              'TOMA UNA FOTO A TU COMPROBANTE DE DEPÓSITO O TRANSFERENCIAS Y ADJÚNTALA USANDO EL BOTÓN CARGAR IMAGEN',
              style: AppTextStyles.mainStyleGreen16Bold(context),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: smallSpacing * 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  elevation: smallSpacing * 0.5,
                  child: SizedBox(
                    width: screenSize.width * 0.4,
                    child: Butoon1(
                      onTap: _pickImage,
                      lblTextField: 'CARGAR IMAGEN',
                    ),
                  ),
                ),
                Card(
                  elevation: smallSpacing * 0.5,
                  child: SizedBox(
                    width: screenSize.width * 0.4,
                    child: Butoon1(
                      onTap: () {
                        if (_pickedImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Adjunte una imagen')),
                          );
                          return;
                        } else {
                          InjectorContainer.getIt<AppRouter>().push(
                            CurrentQrByTypeTreeRoute(
                              nameDepo: widget.nameDepo,
                              bancoOri: widget.bancoOri,
                              cuenta: widget.cuenta,
                              cuentaOri: widget.cuentaOri,
                              cuentaPro: widget.cuentaPro,
                              desFon: widget.desFon,
                              fechaDepo: widget.fechaDepo,
                              moneda: widget.moneda,
                              monto: widget.monto,
                              oriFon: widget.oriFon,
                            ),
                          );
                        }
                      },
                      lblTextField: 'CONTINUAR',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
