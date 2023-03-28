import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(App());
}

//StatelessWidget
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //global var
  // [['Palavra', 'Categoria']]
  List<List<String>> palavras = [
    ['Skyrim', 'Jogo'],
    ['Fallout', 'Jogo'],
    ['Tomate', 'Fruta'],
    ['Kiwi', 'Fruta']
  ];
  List<String> letrasusadas = [];
  int vitoria = 0;
  int derrota = 0;
  int tentativas = 6;
  //
  String userjogada = '';
  String palavrasortida = '';
  String temasortido = '';
  //
  final letterController = TextEditingController();
  //
  String forca = 'images/jogodaforca.gif';
  List<String> resposta = [];
  List<String> palavraescolhida = [];

  ////////////////
  //↓↓↓Funções↓↓↓
  ////////////////
  ////////////////////
  void corda() {
    resposta = List.filled(palavrasortida.length, '_');
  }

  //////////////////
  void escolhido() {
    userjogada = letterController.text.toUpperCase();
    //
    if (letrasusadas.contains(userjogada)) {
      print('repetido');
    } else {
      setState(() => letrasusadas.add(userjogada));
      if (tentativas < 1) {
        derrota++;
        limpeza();
      } else if (palavrasortida.contains(userjogada)) {
        for (int i = 0; i < palavrasortida.length; i++) {
          if (palavrasortida[i] == userjogada) {
            resposta[i] = userjogada;
          }
        }
      } else {
        tentativas--;
      }
    }
    if (listEquals(palavraescolhida, resposta)) {
      vitoria++;
      limpeza();
    }
    print(userjogada);
    print(palavraescolhida);
    print(resposta);
    letterController.clear();
  }

  //
  void limpeza() {
    int randomIndex = Random().nextInt(palavras.length);
    palavrasortida = palavras[randomIndex][0];
    palavrasortida = palavrasortida.toUpperCase();
    palavraescolhida = List.from(palavrasortida.split(''));
    setState(() {
      temasortido = palavras[randomIndex][1];
      forca = 'images/jogodaforca.gif';
      tentativas = 6;
      letrasusadas = [];
    });
    corda();
  }

  //
  void reset() {
    limpeza();
    setState(() {
      vitoria = 0;
      derrota = 0;
    });
    print(palavrasortida);
    print(temasortido);
  }

  ///////////////
  //↑↑↑Funções↑↑↑
  ///////////////
  @override
  Widget build(BuildContext context) {
    //
    //double width = MediaQuery.of(context).size.width;
    //double heigth = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(
          child: Text("Jogo da forca"),
        ),
      ),
      body:
          //↓↓↓codigo↓↓↓
          Column(
        //↓↓↓ atribute collumn
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //↑↑↑
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                width: 100,
                height: 60,
                color: Colors.amber,
                child: Text(
                  'Tema: $temasortido',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                width: 100,
                height: 60,
                color: Colors.lightGreen,
                child: Text(
                  'Vitorias: $vitoria',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                width: 100,
                height: 60,
                color: Colors.redAccent,
                child: Text(
                  'Derrotas: $derrota',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                width: 115,
                height: 60,
                color: Colors.amber,
                child: Text(
                  'Tentativas: $tentativas',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          //

          Container(
            child: Text('Letras usadas:\n$letrasusadas  ',
                style: TextStyle(fontSize: 16)),
          ),
          Image.asset(
            forca,
            width: 250,
            height: 250,
          ),

          Text(
            'Letras ' + palavrasortida.length.toString() + ': $resposta',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          //
          Container(
            color: Colors.white,
            width: 40,
            child: TextField(
              onChanged: (letterController) => escolhido(),
              controller: letterController,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 120,
                height: 80,
                child: ElevatedButton(
                  onPressed: () => limpeza(),
                  child: Text(
                    'Inicar',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              //Container(
              //  padding: EdgeInsets.all(10),
              //  width: 120,
              //  height: 80,
              //  child: ElevatedButton(
              //    onPressed: () => escolhido(),
              //    child: Text(
              //      'Escolher',
              //      textAlign: TextAlign.center,
              //    ),
              //  ),
              //),
              Container(
                padding: EdgeInsets.all(10),
                width: 120,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  onPressed: () => reset(),
                  child: Text(
                    'Reset',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      //↑↑↑codigo↑↑↑
    ));
    //
  }
}
