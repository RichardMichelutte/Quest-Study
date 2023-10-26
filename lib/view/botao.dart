import 'package:flutter/material.dart';

class botao extends StatelessWidget {
  
  final cor;
  final corTexto;
  final String botaoTexto;
  final double tamanho;
  final tap;

  botao({this.cor,this.corTexto,required this.botaoTexto,required this.tamanho,this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: cor,
            child: Center(child: Text(botaoTexto,textAlign: TextAlign.center,style: TextStyle(color: corTexto,fontSize: tamanho,),),),
          ),
        ),
      ),
    );
  }
}