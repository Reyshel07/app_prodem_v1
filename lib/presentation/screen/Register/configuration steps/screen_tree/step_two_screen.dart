import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({
    super.key,
    required this.smallSpacing,
    required this.imgSize,
    required this.letterSize,
    required this.topPadding,
    required this.screenSize,
  });

  final double smallSpacing;
  final double imgSize;
  final double letterSize;
  final double topPadding;
  final Size screenSize;

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  final TextEditingController code1Controller = TextEditingController();
  final TextEditingController code2Controller = TextEditingController();
  bool _esvisible = true;
  FocusNode passWordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.topPadding * 0.05),
      child: Column(
        children: [
          Text(
            'Registre su PIN transaccional, el mismo debe ser un numero de 4 digitos que no debe compartirlo con nadie.',
            style: TextStyle(
              fontSize: widget.letterSize * 0.02,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.green,
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.green,
                  ),
                  borderRadius: BorderRadius.all(radiusCircular(12)),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: code1Controller,
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
                    hintText: "PIN de acceso",
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
              SizedBox(height: widget.smallSpacing * 0.5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.green,
                  ),
                  borderRadius: BorderRadius.all(radiusCircular(12)),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: code2Controller,
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
                    hintText: "Confirme su PIN",
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
              SizedBox(height: widget.smallSpacing * 0.5),
              Butoon1(onTap: () {}, lblTextField: 'Registrar'),
            ],
          ),
        ],
      ),
    );
  }
}
