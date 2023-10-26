// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global/configuracao.dart';

class MateriaView extends StatefulWidget {
  const MateriaView({super.key});

  @override
  State<MateriaView> createState() => _MateriaViewState();
}

class _MateriaViewState extends State<MateriaView> {
  @override
  Widget build(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context);
    bool tema = configuracao.corBack;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Matéria',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: (tema)? Colors.white: Colors.grey,
              foregroundColor: Colors.black,
              minimumSize: Size(240, 80),
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'matematica');
            },
            child: Text(
              'Matemática',
              style: TextStyle(
                fontSize: 21,
                color: (tema)? Colors.black: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: (tema)? Colors.white: Colors.grey,
              foregroundColor: Colors.black,
              minimumSize: Size(240, 80),
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'port');
            },
            child: Text(
              'Português',
              style: TextStyle(
                fontSize: 21,
                color: (tema)? Colors.black: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: (tema)? Colors.white: Colors.grey,
              foregroundColor: Colors.black,
              minimumSize: Size(240, 80),
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'geo');
            },
            child: Text(
              'Geografia',
              style: TextStyle(
                fontSize: 21,
                color: (tema)? Colors.black: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: (tema)? Colors.white: Colors.grey,
              foregroundColor: Colors.black,
              minimumSize: Size(240, 80),
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'hist');
            },
            child: Text(
              'História',
              style: TextStyle(
                fontSize: 21,
                color: (tema)? Colors.black: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: (tema)? Colors.white: Colors.grey,
              foregroundColor: Colors.black,
              minimumSize: Size(240, 80),
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'ing');
            },
            child: Text(
              'Inglês',
              style: TextStyle(
                fontSize: 21,
                color: (tema)? Colors.black: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
