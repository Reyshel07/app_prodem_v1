import 'package:app_prodem_v1/config/router/router.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entity.dart';

@RoutePage()
class EncriptedQRScreen extends StatelessWidget {
  final GetEncryptedQrStringEntity getEncryptedQrStringEntity;
  const EncriptedQRScreen({
    super.key,
    required this.getEncryptedQrStringEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column());
  }
}
