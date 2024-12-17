import 'package:flutter/material.dart';

class EnterPhonePage extends StatelessWidget {
  const EnterPhonePage({super.key});

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
