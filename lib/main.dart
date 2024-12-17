import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'pages/enter_phone_page.dart';
import 'pages/cgu_page.dart';

void main() async {
  // S'assurer que Flutter est initialisé avant d'attendre une tâche async
  WidgetsFlutterBinding.ensureInitialized();

  await loadUserData();

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

Future<void> loadUserData() async {
  final userProvider = UserProvider();

  await userProvider.loadUserData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bouton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Vérifie si les CGU ont déjà été acceptées
      home: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (!userProvider.cguApproved) {
            return const CguPage();
          }
          if (userProvider.cguApproved) {
            return const EnterPhonePage();
          }

          return const CguPage();
        },
      ),
    );
  }
}
