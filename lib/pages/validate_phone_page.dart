import 'package:flutter/material.dart';

class ValidatePhonePage extends StatelessWidget {
  const ValidatePhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Troisième Page")),
      body: const Center(
        child: Text(
          "Bienvenue sur la troisième page!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
