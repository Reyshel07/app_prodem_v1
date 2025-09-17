import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:app_prodem_v1/utils/utils.dart';
import 'package:flutter/material.dart';

class ImgVerde extends StatelessWidget {
  const ImgVerde({
    super.key,
    required this.screenSize,
    required this.topPadding,
    required this.letterSize,
    required this.smallSpacing,
  });

  final Size screenSize;
  final double topPadding;
  final double letterSize;
  final double smallSpacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.18,
      width: screenSize.width * 1,
      child: Card(
        margin: EdgeInsetsDirectional.all(8),
        elevation: smallSpacing * 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(AssetImageApp.getFondoV, fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(topPadding * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SALDO',
                          textAlign: TextAlign.start,
                          style: AppTextStyles.mainStyleWhite14Bold(context),
                        ),
                        Text(
                          '781.56  BS',
                          style: AppTextStyles.mainStyleWhite25Bold(context),
                        ),
                        Text(
                          'ESTADO\n'
                          'Cuenta de ahorro:',
                          style: AppTextStyles.mainStyleWhite14Bold(context),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\n'
                          '\n\n'
                          'ACTIVO\n'
                          '117-5-4-45455-1',
                          style: AppTextStyles.mainStyleWhite14Bold(context),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.sticky_note_2_outlined,
                          color: Theme.of(context).colorScheme.white,
                        ),
                        SizedBox(height: smallSpacing * 0.8),
                        Icon(
                          Icons.remove_red_eye,
                          color: Theme.of(context).colorScheme.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
