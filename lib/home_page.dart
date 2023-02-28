import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/checagem_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Home Page",
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              sair();
            },
            child: const Text("SAIR"),
          ),
        ],
      ),
    );
  }

  sair() async {
    await _firebaseAuth.signOut().then(
          (user) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ChecagemPage(),
            ),
          ),
        );
    //
  }
}
