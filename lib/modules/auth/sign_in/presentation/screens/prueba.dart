import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PruebaScreen extends StatelessWidget {
  final String text;
  const PruebaScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            InjectorContainer.getIt<AppRouter>().pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(child: Text(text)),
    );
  }
}
