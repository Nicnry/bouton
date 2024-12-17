import 'package:flutter/material.dart';
import 'enter_phone_page.dart';
import 'cgu_detail_page.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'package:flutter/gestures.dart';

class CguPage extends StatefulWidget {
  const CguPage({super.key});

  @override
  _CguPageState createState() => _CguPageState();
}

class _CguPageState extends State<CguPage> {
  bool _isCGUAccepted = false;

  @override
  void initState() {
    super.initState();
    _isCGUAccepted =
        Provider.of<UserProvider>(context, listen: false).cguApproved;
  }

  void _toggleCGU(bool value) {
    setState(() {
      _isCGUAccepted = value;
    });
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
                    MaterialPageRoute(
                        builder: (context) => const CguDetailPage()),
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
              if (_isCGUAccepted) {
                Provider.of<UserProvider>(context, listen: false)
                    .setCguApproved(_isCGUAccepted);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnterPhonePage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text('Vous devez accepter les CGU pour continuer.')),
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
