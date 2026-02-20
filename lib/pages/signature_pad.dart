import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import '../widgets/signature_canvas.dart';
import '../widgets/signature_actions.dart';

class SignaturePadPage extends StatefulWidget {
  const SignaturePadPage({super.key});

  @override
  State<SignaturePadPage> createState() => _SignaturePadPageState();
}

class _SignaturePadPageState extends State<SignaturePadPage> {
  final GlobalKey<SignatureState> _signKey = GlobalKey();

  void _confirmSignature() {
    Navigator.pop(context, true);
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