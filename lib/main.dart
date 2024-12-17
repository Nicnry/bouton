import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'pages/welcome_page.dart';
import 'pages/my_app_page.dart';

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
      home: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return userProvider.cguApproved
              ? const WelcomePage()
              : const MyAppPage();
        },
      ),
    );
  }
}
