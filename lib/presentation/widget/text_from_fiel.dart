import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TextFromFiel01 extends StatelessWidget {
  const TextFromFiel01({
    super.key,
    required this.screenSize,
    required this.smallSpacing,
    required this.userController,
    required this.lbText,
  });

  final Size screenSize;
  final double smallSpacing;
  final TextEditingController userController;
  final String lbText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: screenSize.width * 0.8,
        height: screenSize.height * 0.05,
        child: Card(
          elevation: smallSpacing * 0.5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.green),
              borderRadius: BorderRadius.all(radiusCircular(11)),
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: userController,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                hintText: lbText,
                hintStyle: AppTextStyles.mainStyleGreen14(context),
                filled: true,
                isDense: false,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
