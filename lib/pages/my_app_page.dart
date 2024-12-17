import 'package:flutter/material.dart';
import '../pages/welcome_page.dart';
import '../pages/cgu_page.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'package:flutter/gestures.dart';

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  bool _isCGUAccepted = false;

  void _toggleCGU(bool value) {
    setState(() {
      _isCGUAccepted = value;
    });
  }

  void _validateAndProceed() {
    if (!_isCGUAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Vous devez accepter les CGU pour continuer.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CGU acceptées!')),
      );
      //logique pour naviguer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenue !')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Vous semblez être nouveau !",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Center(
            child: Text(
              "Accepter les CGU",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return Text(
                'CGU approuvées: ${userProvider.cguApproved}',
                style: const TextStyle(fontSize: 18),
              );
            },
          ),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              text: 'Confidentialités',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontSize: 16,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CguPage()),
                  );
                },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Accepter les CGU: "),
                Switch(
                  value: _isCGUAccepted,
                  onChanged: _toggleCGU,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _validateAndProceed();
            },
            child: const Text("PRINT ONLY"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_isCGUAccepted) {
                Provider.of<UserProvider>(context, listen: false)
                    .setCguApproved(_isCGUAccepted);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              }
            },
            child: const Text("Confirmer"),
          ),
        ],
      ),
    );
  }
}
