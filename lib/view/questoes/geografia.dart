// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global/configuracao.dart';
import '../botao.dart';

class GeografiaView extends StatefulWidget {
  @override
  State<GeografiaView> createState() => _GeografiaViewState();
}
  
class _GeografiaViewState extends State<GeografiaView> {
bool mostrar = false;

String correta = 'B) Pará';
 final List<String> buttons =
 [
    'A) Amazonas' , 'B) Pará' , 'C) Tocantins',
    'D) Rondônia', 'E) Roraima' , 'F) Piauí',
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
          'Geografia',
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
                      Text('A população da Região Norte está distribuída de forma desigual entre os estados que compõem esse complexo regional. Nesse sentido, marque a alternativa que representa o estado mais populoso do Norte.', style: TextStyle(fontSize: tamanho,color: (tema)? Colors.black : Colors.white,),)
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
                          Navigator.pushNamed(context, 'parabensmat');
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

