// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/cadastrar_page.dart';

import 'package:firebase_crud/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailEC = TextEditingController();
  final _pwdEC = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  bool _showPWD = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN PAGE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _emailEC,
              decoration: const InputDecoration(
                  labelText: "E-mail", hintText: "fulano@email.com"),
            ),
            TextFormField(
              controller: _pwdEC,
              obscureText: _showPWD == false ? true : false,
              decoration: InputDecoration(
                labelText: "Senha",
                hintText: "senha do fulano",
                suffixIcon: GestureDetector(
                  child: Icon(_showPWD == false
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onTap: () {
                    setState(
                      () {
                        _showPWD = !_showPWD;
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text("LOGIN"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastrarPage(),
                  ),
                );
              },
              child: const Text("CRIAR CONTA"),
            ),
          ],
        ),
      ),
    );
  }

  login() async {
    try {
      //
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailEC.text,
        password: _pwdEC.text,
      );
      if (userCredential != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Usuário não encontrado"),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sua senha está errada"),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
