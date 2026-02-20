import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class SignatureActions extends StatelessWidget {
  final GlobalKey<SignatureState> signKey;
  final VoidCallback onConfirm;

  const SignatureActions({
    super.key,
    required this.signKey,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            signKey.currentState?.clear();
          },
          child: const Text("Limpar"),
        ),
        ElevatedButton(
          onPressed: () {
            final sign = signKey.currentState;

            if (sign == null || !sign.hasPoints) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Por favor, assine primeiro"),
                ),
              );
              return;
            }

            onConfirm();
          },
          child: const Text("Confirmar"),
        ),
      ],
    );
  }
}