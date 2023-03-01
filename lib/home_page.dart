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

  String nome = "";
  String email = "";

  @override
  void initState() {
    pegarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Usuário: $nome"),
              accountEmail: Text("E-mail: $email"),
            ),
            ListTile(
              dense: true,
              title: const Text("SAIR"),
              trailing: const Icon(Icons.exit_to_app),
              onTap: () {
                sair();
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            nome,
            textAlign: TextAlign.center,
          ),
          // const Text(
          //   "imprimir usuario",
          //   textAlign: TextAlign.center,
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     pegarUsuario();
          //   },
          //   child: const Text("usuario"),
          // ),
        ],
      ),
    );
  }

  pegarUsuario() async {
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null) {
      setState(() {
        //print(usuario);
        nome = usuario.displayName!;
        email = usuario.email!;
      });
      //print(usuario);
    }
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
