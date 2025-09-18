import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/presentation/screen/home/home_screen.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PasswordScreenProdem extends StatefulWidget {
  static const path = '/PasswordScreenProdem';
  static const name = 'PasswordScreenProdem';
  const PasswordScreenProdem({super.key});

  @override
  State<PasswordScreenProdem> createState() => _PasswordScreenProdemState();
}

class _PasswordScreenProdemState extends State<PasswordScreenProdem> {
  final TextEditingController userController = TextEditingController();
  bool _esvisible = true;
  FocusNode passWordFocus = FocusNode();
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
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INGRESE SU CONTRASEÑA',
                style: AppTextStyles.mainStyleGreen16(context),
              ),
              SizedBox(height: smallSpacing * 0.5),
              SizedBox(
                width: screenSize.width * 0.8,
                child: Card(
                  elevation: smallSpacing * 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.green,
                      ),
                      borderRadius: BorderRadius.all(radiusCircular(12)),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: userController,
                      obscureText: _esvisible,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      focusNode: passWordFocus,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
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
                        hintText: "CONTRASEÑA",
                        hintStyle: AppTextStyles.mainStyleGreen16(context),
                        filled: true,
                        isDense: false,
                        contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _esvisible
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye,
                            color: Color(0xffa7a7a7),
                            size: 22,
                          ),
                          onPressed: () {
                            setState(() {
                              _esvisible = !_esvisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: screenSize.width * 0.5,
                child: Card(
                  elevation: smallSpacing * 0.5,
                  child: Butoon1(onTap: () {}, lblTextField: 'INGRESAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
