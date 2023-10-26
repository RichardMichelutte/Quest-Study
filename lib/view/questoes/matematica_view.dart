// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global/configuracao.dart';
import '../botao.dart';

class MatematicaView extends StatefulWidget {
  @override
  State<MatematicaView> createState() => _MatematicaViewState();
}
  
class _MatematicaViewState extends State<MatematicaView> {
bool mostrar = false;

String correta = 'A) 1/100';
 final List<String> buttons =
 [
    'A) 1/100' , 'B) 19/100' , 'C) 20/100',
    'D) 21/100', 'E) 80/100' , 'F) 100/100',
 ];

  @override
  Widget build(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context);
    bool tema = configuracao.corBack;
    double tamanho = configuracao.fontTamanho;
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Matemática',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text('Questão 1', style: TextStyle(fontSize: 30,color: (tema)? Colors.black : Colors.white,),),
                      Text('Em uma central de atendimento, cem pessoas receberam senhas numeradas de 1 até 100. Uma das senhas é sorteada ao acaso.\n\nQual é a probabilidade de a senha sorteada ser um número de 1 a 20?', style: TextStyle(fontSize: tamanho,color: (tema)? Colors.black : Colors.white,),),
                    ],
                  ),
                ),
              )
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                    itemBuilder: (BuildContext context, int index) {
                      return botao(
                        tap: (){
                          (correta == buttons[index])?
                          setState(() {
                            mostrar = true;
                            configuracao.quantRespo++;
                          }):
                          setState(() {
                            mostrar = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Você Errou a Questão',textAlign: TextAlign.center,), duration: Duration(seconds: 1),)
                            );
                          });
                        },
                        botaoTexto: buttons[index],
                        cor: Colors.red,
                        corTexto: Colors.white,
                        tamanho: 16,
                      );
                    }
                    ),
                  
                ),
              ),
              (mostrar)?Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Expanded(
                  child: Container(
                    child: Padding(
                    padding: const EdgeInsets.only(left:18, right: 18,bottom: 18),
                    child: Column(
                      children: [
                        Text('Correto', style: TextStyle(fontSize: 30,color: (tema)? Colors.black : Colors.white,),),
                        OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.black,
                          minimumSize: Size(120, 40),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'matquest2');
                        },
                        child: Text(
                          'Proximo',
                          style: TextStyle(
                            fontSize: 21,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                  ),
                ),
              ) : Padding(
                padding: const EdgeInsets.only(bottom:16),
                child: Expanded(child: Text('Acerte a questão para prosseguir',style: TextStyle(color: (tema)? Colors.black : Colors.white,)),),
              ),
          ],
        ),
    );
  }
}

