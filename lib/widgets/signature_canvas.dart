import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class SignatureCanvas extends StatelessWidget {
  final GlobalKey<SignatureState> signKey;

  const SignatureCanvas({
    super.key,
    required this.signKey,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey[300],
        child: Signature(
          key: signKey,
          color: Colors.black,
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}