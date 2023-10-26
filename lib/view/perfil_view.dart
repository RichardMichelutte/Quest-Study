// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../global/configuracao.dart';

import '../global/configuracao.dart';
import '../global/contas.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  final _formfield = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  bool emailToggle = true;
  bool nameToggle = true;
  //final perfil = Provider.of<Configuracao>(context);

  @override
  Widget build(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context);
    final conta = Provider.of<Conta>(context);
    String nome = conta.nome;
    String email = conta.email;
    bool tema = configuracao.corBack;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Text(
          'Perfil',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 25, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.red),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.3))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/imagens/boy.png'))),
                  ),
                  //Botão de editar se caso quiser adicionar ele no perfil
                  /*Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
                        color: Colors.red,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  )*/
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Text(
                'Nome: $nome',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: (tema) ? Colors.black : Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                'E-mail: $email',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: (tema) ? Colors.black : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Parte do código se quiser ter uma edição nos dados Nome e email
            /*
            SizedBox(height: 20),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                //controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Entre com o seu nome!";
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}^~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                }),
            SizedBox(height: 20),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
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
                */
            SizedBox(height: 70),
            InkWell(
              onTap: () {
                if (_formfield.currentState!.validate()) {
                  print("Sucesso");
                  emailController.clear();
                  passController.clear();
                  Navigator.pushNamed(context, 'home');
                }
              },
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Center(
                  child: Text(
                    "Pontuação",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Quantidade Respondidas: ${configuracao.quantRespo.round().toString()}',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
