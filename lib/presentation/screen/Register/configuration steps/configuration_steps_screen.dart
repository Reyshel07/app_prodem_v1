import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/presentation/screen/Register/configuration%20steps/screen_tree/step_one_screen.dart';
import 'package:app_prodem_v1/presentation/screen/Register/configuration%20steps/screen_tree/step_two_screen.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';

class ConfigurationStepsScreen extends StatefulWidget {
  static const path = '/ConfigurationStepsScreen';
  static const name = 'ConfigurationStepsScreen';
  const ConfigurationStepsScreen({super.key});

  @override
  State<ConfigurationStepsScreen> createState() =>
      _ConfigurationStepsScreenState();
}

class _ConfigurationStepsScreenState extends State<ConfigurationStepsScreen> {
  final TextEditingController deviceNameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double topPadding = screenSize.height * 0.2;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double imgSize = screenSize.width * 0.4;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Bienvenido a Banco Prodem S.A.',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: TabBar(
                tabs: [
                  Tab(text: 'paso 1'),
                  Tab(text: 'Paso 2'),
                ],
                labelColor: Theme.of(context).colorScheme.green,
                indicatorColor: Theme.of(context).colorScheme.green,
                unselectedLabelColor: Theme.of(context).colorScheme.green,
                indicatorWeight: 5,
                dividerColor: Theme.of(context).colorScheme.green,
                dividerHeight: 2,
                unselectedLabelStyle: TextStyle(fontSize: letterSize * 0.018),
                labelStyle: TextStyle(
                  fontSize: letterSize * 0.020,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: StepOne(
                      smallSpacing: smallSpacing,
                      letterSize: letterSize,
                      imgSize: imgSize,
                      topPadding: topPadding,
                      screenSize: screenSize,
                      deviceName: deviceNameController,
                      codigo: codeController,
                    ),
                  ),
                  Center(
                    child: StepTwo(
                      smallSpacing: smallSpacing,
                      letterSize: letterSize,
                      imgSize: imgSize,
                      topPadding: topPadding,
                      screenSize: screenSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
