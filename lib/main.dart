// ignore_for_file: prefer_const_constructors, deprecated_member_use

//import 'package':quest_study/mixin;
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quest_study/global/contas.dart';
import 'package:quest_study/view/Inicio_view.dart';
import 'package:quest_study/view/cadastra_view.dart';
import 'package:quest_study/view/configuracao_view.dart';
import 'package:quest_study/view/home_page.dart';
import 'package:quest_study/view/sobre_view.dart';
import 'package:quest_study/view/login_view.dart';
import 'package:quest_study/view/senha_view.dart';
import 'package:quest_study/view/questoes/matematica_view.dart';

import 'global/configuracao.dart';
import 'view/questoes/Ingles.dart';
import 'view/questoes/geografia.dart';
import 'view/questoes/historia.dart';
import 'view/questoes/matematica2_view.dart';
import 'view/materia_view.dart';
import 'view/parabensmat.dart';
import 'view/questoes/portugues.dart';

void main() {
  //iniciar a execução do App
  runApp(
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (context) => Conta()),
        ChangeNotifierProvider(create: (context) => Configuracao()),
      ],
      child: QuestApp(),
    ),
  );
}

class QuestApp extends StatelessWidget with WidgetsBindingObserver {
  const QuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context);
    bool tema = configuracao.corBack;
    return DevicePreview(
        enabled: true,
        builder: (context) => MaterialApp(
              useInheritedMediaQuery: true,
              debugShowCheckedModeBanner: false,
              title: 'Quest Study',
              theme: ThemeData(
                primarySwatch: Colors.red,
                scaffoldBackgroundColor:
                    (tema) ? Colors.white : Color.fromRGBO(41, 44, 46, 1),
              ),
              home: InicioView(),
              routes: {
                'home': (context) => HomePage(),
                'inicio': (context) => InicioView(),
                'sobre': (context) => SobreView(),
                'login': (context) => LoginView(),
                'cadastra': (context) => CadastraView(),
                'senha': (context) => SenhaView(),
                'matematica': (context) => MatematicaView(),
                'config': (context) => ConfigView(),
                'matquest2': (context) => Matematica2View(),
                'parabensmat': (context) => parabensmat(),
                'materia': (context) => MateriaView(),
                'port': (context) => PortuguesView(),
                'geo': (context) => GeografiaView(),
                'hist': (context) => HistoriaView(),
                'ing': (context) => InglesView(),
              },
            ));
  }
}
