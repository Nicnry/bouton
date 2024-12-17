import 'package:flutter/material.dart';

class CguPage extends StatelessWidget {
  const CguPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conditions générales d'utilisation")),
      body: const Center(
        child: Text(
          "Bienvenue sur les CGU!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
