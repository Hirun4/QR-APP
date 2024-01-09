import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String scanResult = "Scan a QR code";

  Future<void> startQRScan() async {
    String result;
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      if (result == "-1") return; // Scan was canceled

      setState(() {
        scanResult = result;
      });

      if (Uri.tryParse(result)?.hasAbsolutePath == true) {
        _launchURL(result);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid URL: $result")),
        );
      }
    } catch (e) {
      result = "Failed to get platform version.";
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(scanResult),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: startQRScan,
              child: const Text('Start QR Scan'),
            ),
          ],
        ),
      ),
    );
  }
}
