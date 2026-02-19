import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {

      },
      child: const Text("Assinar"),
    );
  }
}