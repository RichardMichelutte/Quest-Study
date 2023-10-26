// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global/configuracao.dart';
import '../botao.dart';

class Matematica2View extends StatefulWidget {
  @override
  State<Matematica2View> createState() => _Matematica2ViewState();
}
  
class _Matematica2ViewState extends State<Matematica2View> {
bool mostrar = false;
String correta = 'E) 20,85';
 final List<String> buttons =
 [
    'A) 20,60' , 'B) 20,70' , 'C) 20,77',
    'D) 20,80', 'E) 20,85' , 'F) 20,90',
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
                  padding: const EdgeInsets.only(top: 6,bottom:16.0,left: 16.0,right: 16.0),
                  child: Column(
                    children: [
                      Text('Questão 2', style: TextStyle(fontSize: 30,color: (tema)? Colors.black : Colors.white,),),
                      Text('Em uma seletiva para a final dos 100 metros livres de natação, numa olimpíada, os atletas, em suas respectivas raias, obtiveram os seguintes tempos:', style: TextStyle(fontSize: tamanho,color: (tema)? Colors.black : Colors.white,),),
                      Image.asset('assets/imagens/imagem_matematica.png',width: 365,height: 66,),
                      Text('A mediana dos tempos apresentados no quadro é:', style: TextStyle(fontSize: tamanho,color: (tema)? Colors.black : Colors.white,),),
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
                child: Expanded(child: Text('Acerte a questão para prosseguir',style: TextStyle(color: (tema)? Colors.black : Colors.white,),),),
              ),
          ],
        ),
    );
  }
}

