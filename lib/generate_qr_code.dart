import 'package:flutter/material.dart';

class GenerateQRCode extends StatelessWidget {
  const GenerateQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    const String githubProfileUrl = "https://github.com/Hirun4";
    final String qrApiUrl =
        'https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=$githubProfileUrl';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              qrApiUrl,
              width: 200,
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Could not load QR code image');
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Scan this QR code to open GitHub profile',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
