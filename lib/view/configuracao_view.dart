import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global/configuracao.dart';

class ConfigView extends StatefulWidget {
  const ConfigView({super.key});

  @override
  State<ConfigView> createState() => _ConfigViewState();
}

class _ConfigViewState extends State<ConfigView> {
  @override
  Widget build(BuildContext context) {
    final configuracao = Provider.of<Configuracao>(context);
    bool tema = configuracao.corBack;
    double tamanho = configuracao.fontTamanho;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Configurações',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 24, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (tema)
                          ? Color.fromARGB(255, 216, 215, 215)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 300,
                    height: 80,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 75),
                        child: Row(
                          children: [
                            Text(
                              (tema) ? 'Tema: Claro' : 'Tema: Escuro',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: (tema) ? Colors.black : Colors.white),
                            ),
                            Switch(
                                value: tema,
                                onChanged: (value) {
                                  setState(() {
                                    configuracao.corBack =
                                        !configuracao.corBack;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (tema)
                          ? Color.fromARGB(255, 216, 215, 215)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 300,
                    height: 80,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Tamanho da fonte ${tamanho.round().toString()}',
                            style: TextStyle(
                                fontSize: tamanho,
                                color: (tema) ? Colors.black : Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Slider(
                            value: tamanho,
                            max: 23,
                            min: 16,
                            divisions: 8,
                            onChanged: (double value) {
                              configuracao.fontTamanho = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
