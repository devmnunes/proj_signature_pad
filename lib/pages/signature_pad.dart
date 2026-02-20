import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import '../widgets/signature_canvas.dart';
import '../widgets/signature_actions.dart';
import 'dart:ui' as ui;
import 'dart:convert';


class SignaturePadPage extends StatefulWidget {
  const SignaturePadPage({super.key});

  @override
  State<SignaturePadPage> createState() => _SignaturePadPageState();
}

class _SignaturePadPageState extends State<SignaturePadPage> {
  final GlobalKey<SignatureState> _signKey = GlobalKey();

  void _confirmSignature() async {
    String? base64 = await _getSignatureBase64();

    if (base64 == null) {
      return null;
    }

    print('base64: $base64');
  
    Navigator.pop(context, base64);
  }

  Future<String?> _getSignatureBase64() async {
    final signature = _signKey.currentState;

    if (signature == null || !signature.hasPoints) {
      return null;
    }
    
    ui.Image image = await signature.getData();

    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      return null;
    }

    Uint8List pngBytes = byteData.buffer.asUint8List();

    String base64String = base64Encode(pngBytes);

    return base64String;
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Assinar"),
      ),
      body: Column(
        children: [
          SignatureCanvas(signKey: _signKey),
          const SizedBox(height: 20),
          SignatureActions(
            signKey: _signKey,
            onConfirm: _confirmSignature,
          ),
        ],
      ),
    );
  }
}