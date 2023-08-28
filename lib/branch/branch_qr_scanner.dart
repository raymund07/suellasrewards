import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BranchQRScannerScreen extends StatefulWidget {
  @override
  _BranchQRScannerScreenState createState() => _BranchQRScannerScreenState();
}

class _BranchQRScannerScreenState extends State<BranchQRScannerScreen> {
  String _qrCode = 'Scan a QR code';

  Future<void> _scanQRCode() async {
    String qrCode = await FlutterBarcodeScanner.scanBarcode(
      '#FF5722', // Color for the scan button
      'Cancel', // Text for the cancel button
      false, // Show flash icon (if available)
      ScanMode.QR, // Scan mode (QR, BARCODE, etc.)
    );

    if (!mounted) return;

    setState(() {
      _qrCode = qrCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Branch QR Scanner'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _qrCode,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanQRCode,
              child: Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
