import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/checagem_page.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class CadastrarPage extends StatefulWidget {
  const CadastrarPage({super.key});

  @override
  State<CadastrarPage> createState() => _CadastrarPageState();
}

class _CadastrarPageState extends State<CadastrarPage> {
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _pwdEC = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CADASTRO PAGE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            TextFormField(
              autofocus: true,
              controller: _nameEC,
              decoration: const InputDecoration(
                labelText: "Nome Completo",
              ),
              validator: Validatorless.multiple([
                Validatorless.required("*Obrigatório"),
                Validatorless.min(3, "Minimo 3 caracteres")
              ]),
            ),
            TextFormField(
              controller: _emailEC,
              decoration: const InputDecoration(labelText: "Email"),
              validator: Validatorless.multiple([
                Validatorless.required("Email obrigatório"),
                Validatorless.email("Email inválido"),
              ]),
            ),
            TextFormField(
              obscureText: true,
              controller: _pwdEC,
              decoration: const InputDecoration(
                labelText: "Senha",
              ),
              validator: Validatorless.multiple([
                Validatorless.required("Senha Obrigatória"),
                Validatorless.min(3, "Minimo 3 caracteres")
              ]),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirme Senha",
              ),
              validator: Validatorless.multiple([
                Validatorless.required("Confirmação obrigatória"),
                Validatorless.compare(_pwdEC, "SENHAS NÃO CONFEREM")
              ]),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  final valid = _formKey.currentState?.validate() ?? false;
                  if (valid) {
                    cadastrar();
                  }
                },
                child: const Text("CADASTRAR"))
          ]),
        ),
      ),
    );
  }

  Future cadastrar() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailEC.text, password: _pwdEC.text);
      if (userCredential != null) {
        //
        userCredential.user!.updateDisplayName(_nameEC.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ChecagemPage(),
            ),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "week-password") {
        //
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("CRIE UMA SENHA MAIS FORTE"),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("E-MAIL JÁ CADASTRADO"),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  // cadastrar() async {
  //   _firebaseAuth
  //       .createUserWithEmailAndPassword(
  //           email: _emailEC.text, password: _pwdEC.text)
  //       .then(
  //     (UserCredential userCredential) {
  //       userCredential.user!.updateDisplayName(_nameEC.text);
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const ChecagemPage(),
  //           ),
  //           (route) => false);
  //     },
  //   ).catchError(
  //     (FirebaseAuthException firebaseAuthException) {
  //       //
  //     },
  //   );
  // }
}
