import 'package:app_financy/common/constants/routes.dart';
import 'package:app_financy/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _secureStorage = const SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Nova Tela"),
            ElevatedButton(
                onPressed: () {
                  _secureStorage.deleteOne(key: "CURRERNT_USER").then((_) =>
                      Navigator.popAndPushNamed(context, NamedRoute.initial));
                },
                child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}
