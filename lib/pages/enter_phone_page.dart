import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'validate_phone_page.dart';
import 'cgu_page.dart';

class EnterPhonePage extends StatefulWidget {
  const EnterPhonePage({super.key});

  @override
  State<EnterPhonePage> createState() => _EnterPhonePageState();
}

class _EnterPhonePageState extends State<EnterPhonePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final variable = Provider.of<UserProvider>(context).cguApproved;

    return Scaffold(
      appBar: AppBar(title: const Text("Nouvelle Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Variable: $variable',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                "Entrez votre numéro de téléphone :",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Ex: 1234567890",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.phone),
                ),
                maxLength: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Le numéro de téléphone est requis.";
                  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return "Le numéro doit contenir exactement 10 chiffres.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final phoneNumber = _phoneController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Numéro valide: $phoneNumber")),
                      );
                    }
                  },
                  child: const Text("Valider"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ValidatePhonePage()),
                  );
                },
                child: const Text("Aller à la troisième page"),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .setCguApproved(false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const CguPage()),
                  );
                },
                child: const Text("Supprimer les cgu"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
