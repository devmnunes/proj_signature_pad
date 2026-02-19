import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class SignaturePadPage extends StatefulWidget {
  const SignaturePadPage({Key? key}) : super(key: key);

  @override
  State<SignaturePadPage> createState() => _SignaturePadPageState();
}

class _SignaturePadPageState extends State<SignaturePadPage> {
  final GlobalKey<SignatureState> _signKey = GlobalKey();

  bool _assinaturaConfirmada = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assinar")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: Signature(
                key: _signKey,
                color: Colors.black,
                strokeWidth: 5.0,
              ),
            ),
          ),

          SizedBox(height: 20),

          if (!_assinaturaConfirmada)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _signKey.currentState?.clear();
                  },
                  child: Text("Limpar"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final sign = _signKey.currentState;

                    if (sign == null || !sign.hasPoints) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Por favor, assine primeiro"),
                        ),
                      );
                      return;
                    }

                    Navigator.pop(context, true); 
                  },
                  child: Text("Confirmar"),
                ),
              ],
            )
          else
            Column(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 60),
                SizedBox(height: 10),
                Text(
                  "Assinatura realizada com sucesso!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("Voltar para Home"),
                ),
              ],
            ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}
