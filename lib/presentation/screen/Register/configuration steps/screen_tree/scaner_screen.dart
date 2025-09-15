import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_tools/qr_code_tools.dart';

class ScannerScreen extends StatefulWidget {
  static const path = '/ScanerScreen';
  static const name = 'ScanerScreen';

  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool _isReturned = false;

  Future<void> _pickImageAndScan() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      try {
        final qrData = await QrCodeToolsPlugin.decodeFrom(image.path);
        if (!_isReturned && qrData != null && qrData.isNotEmpty) {
          _isReturned = true;
          Navigator.pop(context, qrData);
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
    //final screenSize = MediaQuery.of(context).size;
    //final double letterSize = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.white,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text('Scaner'),
        /*actions: [
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: _pickImageAndScan,
          ),
        ],*/
      ),
      body: MobileScanner(
        useAppLifecycleState: false,
        onDetect: (barcodeCapture) {
          if (_isReturned) return;

          final barcode = barcodeCapture.barcodes.first;
          final value = barcode.rawValue;

          if (value != null && value.isNotEmpty) {
            _isReturned = true;
            Navigator.pop(context, value);
          }
        },
      ),
    );
  }
}
