import 'package:flutter/material.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate qr code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
