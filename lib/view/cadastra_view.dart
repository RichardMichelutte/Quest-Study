import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global/contas.dart';

class CadastraView extends StatefulWidget {
  @override
  State<CadastraView> createState() => _CadastraViewState();
}

class _CadastraViewState extends State<CadastraView> {
  final _formfield = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  bool emailToggle = true;
  bool nameToggle = true;

  @override
  Widget build(BuildContext context) {
    final conta = Provider.of<Conta>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar-se'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formfield,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/imagens/avatar.png',
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 50),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Nome",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Entre com o seu nome!";
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}^~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      conta.nome = value;
                    }),
                SizedBox(height: 20),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Entre com o Email!";
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}^~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      conta.email = value;
                    }),
                SizedBox(height: 20),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: passController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Entre com a senha!";
                      }
                      bool emailToggle = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}^~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      conta.senha = value;
                    }),
                SizedBox(height: 60),
                InkWell(
                  onTap: () {
                    if (_formfield.currentState!.validate()) {
                      print("Sucesso");
                      emailController.clear();
                      passController.clear();
                      Navigator.pushNamed(context, 'login');
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Já tem uma conta ?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
