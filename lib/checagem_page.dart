import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/home_page.dart';
import 'package:firebase_crud/login_page.dart';
import 'package:flutter/material.dart';

class ChecagemPage extends StatefulWidget {
  const ChecagemPage({super.key});

  @override
  State<ChecagemPage> createState() => _ChecagemPageState();
}

class _ChecagemPageState extends State<ChecagemPage> {
  StreamSubscription? streamSubscription;

  @override
  void initState() {
    super.initState();

    streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('Você não tem usuário Logado!');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
          print('Usuário Logado!');
        }
      },
    );
  }

  @override
  void dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHECAGEM PAGE'),
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
