import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/ATM/validate_qr_from_prodem_movil/presentation/bloc/validate_qr_from_prodem_movil_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_tools/qr_code_tools.dart';

@RoutePage()
class ValidateQrFromProdemMovilScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  const ValidateQrFromProdemMovilScreen({super.key, required this.sessionBloc});

  @override
  State<ValidateQrFromProdemMovilScreen> createState() =>
      _ValidateQrFromProdemMovilScreenState();
}

class _ValidateQrFromProdemMovilScreenState
    extends State<ValidateQrFromProdemMovilScreen> {
  bool _isReturned = false;
  late final ValidateQrFromProdemMovilBloc _validateBloc;
  String? _scannedQrValue;

  @override
  void initState() {
    super.initState();
    _validateBloc = InjectorContainer.getIt<ValidateQrFromProdemMovilBloc>();
  }

  Future<void> _pickImageAndScan() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      try {
        final qrData = await QrCodeToolsPlugin.decodeFrom(image.path);
        if (!_isReturned && qrData != null && qrData.isNotEmpty) {
          _isReturned = true;
          _scannedQrValue = qrData;
          _validateBloc.add(ValidateQrFromPRodemMEvent(qrCode: qrData));
        } else {
          _showMessage('No se encontró código QR en la imagen.');
        }
      } catch (e) {
        _showMessage('Error al escanear la imagen: $e');
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _validateBloc,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Validar QR Prodem Móvil',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.image),
              onPressed: _pickImageAndScan,
            ),
          ],
        ),
        body:
            BlocListener<
              ValidateQrFromProdemMovilBloc,
              ValidateQrFromProdemMovilState
            >(
              listener: (context, state) {
                if (state is ValidateQrFromProdemMovilLoading) {
                  // loading se maneja visualmente en el Stack
                } else if (state is ValidateQrFromProdemMovilSuccess) {
                  // navega a pantalla de resultado
                  InjectorContainer.getIt<AppRouter>().push(
                    ValidateQRfromProdemMovilTwoRoute(
                      sessionBloc: widget.sessionBloc,
                      res: state.validateQrFromProdemMovilResponseEntity,
                      qRGenerated: _scannedQrValue ?? '',
                    ),
                  );
                } else if (state is ValidateQrFromProdemMovilError) {
                  _showMessage(state.message);
                  _isReturned = false;
                }
              },
              child: Stack(
                children: [
                  MobileScanner(
                    useAppLifecycleState: false,
                    onDetect: (barcodeCapture) {
                      if (_isReturned) return;

                      final barcode = barcodeCapture.barcodes.first;
                      final value = barcode.rawValue;

                      if (value != null && value.isNotEmpty) {
                        _isReturned = true;
                        _scannedQrValue = value;
                        _validateBloc.add(
                          ValidateQrFromPRodemMEvent(qrCode: value),
                        );
                      }
                    },
                  ),
                  // loading overlay
                  BlocBuilder<
                    ValidateQrFromProdemMovilBloc,
                    ValidateQrFromProdemMovilState
                  >(
                    builder: (context, state) {
                      if (state is ValidateQrFromProdemMovilLoading) {
                        return Container(
                          color: Colors.black54,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
