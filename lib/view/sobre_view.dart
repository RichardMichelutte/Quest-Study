// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global/configuracao.dart';

class SobreView extends StatelessWidget {
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context);
    bool tema = configuracao.corBack;
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          'Sobre',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'Aplicativo Criado Para o Projeto Parte 1: Interfaces Gráficas e Navegação\n\nTema: Aplicativo de Questões\n\nObjetivo do aplicativo: Desenvolver um aplicativo educacional que disponibiliza questões a serem respondidas de acordo com a preferência de temas do usuário.\n\n',
              style: TextStyle(
                color: (tema)? Colors.black : Colors.white,
                fontSize: 18
              ),
            ),
            SizedBox(height: 30,),
            Center(child: Text('Desenvolvedores',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: (tema)? Colors.black : Colors.white,),),),
            Container(
              decoration: BoxDecoration(
                color: (tema)? Color.fromARGB(255, 216, 215, 215): Colors.grey,
                ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/imagens/Richard.png',
                    height: 150,
                    width: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8,right: 24,left:36,bottom: 8),
                    child: Text('RICHARD\nWALLACY\nHOLLYWOOD\nMICHELUTTE\nNEPOMUCENO\nFERREIRA',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: (tema)? Colors.black : Colors.white,)),
                  ),
                ],
              ),
            ),
            Center(child: Text('&',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: (tema)? Colors.black : Colors.white,),),),
            Container(
              decoration: BoxDecoration(
                color: (tema)? Color.fromARGB(255, 216, 215, 215): Colors.grey,
                ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/imagens/Vinicius.png',
                    height: 150,
                    width: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8,right: 24,left:46,bottom: 8),
                    child: Text('VINICIUS\nPIMENTEL\nMARQUES\nDE\nMENDONCA',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: (tema)? Colors.black : Colors.white,)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}