import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/presentation/bloc/decrypt_qr_string_bloc.dart';

@RoutePage()
class DecryptQrStringScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  const DecryptQrStringScreen({super.key, required this.sessionBloc});

  @override
  State<DecryptQrStringScreen> createState() => _DecryptQrStringScreenState();
}

class _DecryptQrStringScreenState extends State<DecryptQrStringScreen> {
  bool _isReturned = false;
  late final DecryptQrStringBloc _decryptBloc;
  String? _scannedQrValue;

  Future<void> _pickImageAndScan() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      try {
        final qrData = await QrCodeToolsPlugin.decodeFrom(image.path);
        if (!_isReturned && qrData != null && qrData.isNotEmpty) {
          _isReturned = true;
          // dispatch to bloc for processing
          _decryptBloc.add(DecryptQrStrEvent(qrString: qrData));
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
    // provide the decrypt bloc via GetIt
    _decryptBloc = InjectorContainer.getIt<DecryptQrStringBloc>();

    final scaffold = Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.white,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text(
          'Scanner QR PRODEM',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: _pickImageAndScan,
          ),
        ],
      ),
      body: BlocListener<DecryptQrStringBloc, DecryptQrStringState>(
        listener: (context, state) {
          if (state is DecryptQrStringLoading) {
            // optionally show a loading overlay (handled below)
          } else if (state is DecryptQrStringSuccess) {
            // navigate to result screen with the decrypted entity
            InjectorContainer.getIt<AppRouter>().push(
              DecryptQrRoute(
                decryptQrStringEntity: state.decryptQrStringEntity,
                sessionBloc: widget.sessionBloc,
                stringQr: _scannedQrValue ?? '',
              ),
            );
          } else if (state is DecryptQrStringError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            _isReturned = false; // allow scanning again
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
                  _scannedQrValue = value; // <-- guardamos el valor leído
                  _decryptBloc.add(DecryptQrStrEvent(qrString: value));
                }
              },
            ),
            // show loading indicator when bloc state is loading
            BlocBuilder<DecryptQrStringBloc, DecryptQrStringState>(
              builder: (context, state) {
                if (state is DecryptQrStringLoading) {
                  return Container(
                    color: Colors.black45,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );

    return BlocProvider.value(value: _decryptBloc, child: scaffold);
  }
}
