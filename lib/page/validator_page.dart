import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/page/home/home_page.dart';
import 'package:firebase_crud/page/auth/login_page.dart';
import 'package:flutter/material.dart';

class Validator extends StatefulWidget {
  const Validator({super.key});

  @override
  State<Validator> createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  StreamSubscription? streamSubscription;

  @override
  void initState() {
    super.initState();

    streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          //print('VOCÊ NÃO ESTÁ LOGADO');
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
          //print('VOCÊ ESTÁ LOGADO');
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
