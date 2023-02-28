import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class CadastrarPage extends StatelessWidget {
  CadastrarPage({super.key});

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _pwdEC = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CADASTRAR PAGE'),
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
                Validatorless.min(5, "Minimo 5 caracteres")
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
                Validatorless.min(6, "Minimo 6 caracteres")
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
            ElevatedButton(onPressed: () {}, child: Text("CADASTRAR"))
          ]),
        ),
      ),
    );
  }

  cadastrar() async {
    //
  }
}
