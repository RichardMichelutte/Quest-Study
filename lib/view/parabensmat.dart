import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global/configuracao.dart';

class parabensmat extends StatefulWidget {
  const parabensmat({super.key});

  @override
  State<parabensmat> createState() => _parabensmatState();
}

class _parabensmatState extends State<parabensmat> {
  @override
  Widget build(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context);
    bool tema = configuracao.corBack;
    
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.only(top: 180),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/imagens/trofeu.png',width: 215,height: 215,),
              SizedBox(
                width: double.infinity,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 64,right: 64),
                child: Text('Parabéns Você concluiu esta matéria',textAlign: TextAlign.center,
                style: TextStyle(
                  color: (tema)? Colors.black : Colors.white,
                  fontSize: 50
                ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
              ),
              OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: (tema)? Colors.red : Colors.white) 
              ),
              onPressed: (){ Navigator.pushNamed(context, 'home',);}, 
              child: Text('Voltar ao inicio',style: TextStyle(fontSize: 16,color: (tema)? Colors.red : Colors.white),),
              ),
            ],
          ),
          ),
        ),
    );
  }
}