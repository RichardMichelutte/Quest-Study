//VOU USAR FUTURAMENTE --- Richard

import 'package:flutter/material.dart';

class SenhaView extends StatefulWidget {
  @override
  State<SenhaView> createState() => _SenhaViewState();
}

class _SenhaViewState extends State<SenhaView> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: true,
        title: Text(
          'Recuperar Senha',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Form(
          key: _formfield,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/imagens/resetpassword.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 50),
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
                  }),
              SizedBox(height: 60),
              InkWell(
                onTap: () {
                  if (_formfield.currentState!.validate()) {
                    print("Sucesso");
                    emailController.clear();
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
                      "Enviar codigo de recuperação",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
