import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signature_pad.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _assinou = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Proj Signature Pad"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: _assinou
                ? null
                : () async {
                    final resultado = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignaturePadPage(),
                      ),
                    );

                    if (resultado == true) {
                      setState(() {
                        _assinou = true;
                      });

                      showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                          title: Text("Sucesso"),
                          content: Text(
                            "Assinatura realizada com sucesso!",
                          ),
                        ),
                      );
                    }
                  },
            child: Text(
              _assinou
                  ? "Documento Assinado"
                  : "Assinar Documento",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
