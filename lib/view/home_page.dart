// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quest_study/view/materia_view.dart';
import 'package:quest_study/view/menu_view.dart';
import '../global/configuracao.dart';
import 'perfil_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 1;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
  final configuracao = Provider.of<Configuracao>(context);
    bool tema = configuracao.corBack;
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          MateriaView(),
          PerfilView(),
          MenuView(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        backgroundColor: (tema)? Color.fromRGBO(231, 231, 231, 1): Colors.grey,
        unselectedItemColor: (tema)? Color.fromARGB(255, 141, 141, 141): const Color.fromARGB(255, 211, 211, 211),
        fixedColor: (tema)? Colors.black: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                color: (tema)? Colors.black: Colors.white,
              ),
              label: 'Matérias',
              backgroundColor: Color.fromARGB(255, 211, 211, 211)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: (tema)? Colors.black: Colors.white,
              ),
              label: 'Perfil',
              backgroundColor: Color.fromARGB(255, 211, 211, 211)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                color: (tema)? Colors.black: Colors.white,
              ),
              label: 'Menu',
              backgroundColor: Color.fromARGB(255, 211, 211, 211)),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina,
              duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
