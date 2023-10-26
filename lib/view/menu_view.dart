// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quest_study/global/configuracao.dart';






class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {


  @override
  Widget build(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context);
    bool tema = configuracao.corBack;
    return Scaffold(

      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        title: Text(
          'MENU',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 24, top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      
                      style: OutlinedButton.styleFrom(
                        
                        backgroundColor:  (tema)? Color.fromRGBO(231, 231, 231, 1): Colors.grey,
                        foregroundColor: Colors.black,
                        minimumSize: Size(240, 80),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'config');
                      },
                      child: Text(
                        'Configurações',
                        style: TextStyle(
                          fontSize: 21,
                          color: (tema)? Colors.black: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24, top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor:  (tema)? Color.fromRGBO(231, 231, 231, 1): Colors.grey,
                        foregroundColor: Colors.black,
                        minimumSize: Size(240, 80),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'sobre');
                      },
                      child: Text(
                        'Sobre',
                        style: TextStyle(
                          fontSize: 21,
                          color: (tema)? Colors.black: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24, top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor:  (tema)? Color.fromRGBO(231, 231, 231, 1): Colors.grey,
                        foregroundColor: Colors.black,
                        minimumSize: Size(240, 80),
                      ),
                      onPressed: () {
                        configuracao.corBack = true;
                        Navigator.pushNamed(context, 'inicio');
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Sair '),
                            WidgetSpan(child: Icon(Icons.logout,color: (tema)? Colors.black: Colors.white,)),
                          ],
                          style: TextStyle(
                            fontSize: 21,
                            color: (tema)? Colors.black: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
