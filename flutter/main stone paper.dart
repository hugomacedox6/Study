import 'dart:html';

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
  List<String> escolhaia = ['papel', 'pedra', 'tesoura'];
  int vitoria = 0;
  int derrota = 0;
  int empate = 0;
  String userjogada = '';
  //
  String iajogada = '';
  String imagem = 'images/jokenpo.gif';
  ////////////////
  //↓↓↓Funções↓↓↓
  ////////////////

  void escolhido(String escolha) {
    userjogada = escolha;
    int randomIndex = Random().nextInt(escolhaia.length);
    iajogada = escolhaia[randomIndex];
    setState(() {
      imagem = 'images/$iajogada.png';
    });
    if (iajogada == userjogada) {
      empate++;
    } else {
      switch (userjogada) {
        case ('papel'):
          if (iajogada == 'pedra') {
            vitoria++;
          } else if (iajogada == 'tesoura') {
            derrota++;
          }
          break;
        case ('pedra'):
          if (iajogada == 'tesoura') {
            vitoria++;
          } else if (iajogada == 'papel') {
            derrota++;
          }
          break;
        case ('tesoura'):
          if (iajogada == 'papel') {
            vitoria++;
          } else if (iajogada == 'pedra') {
            derrota++;
          }
          break;
        default:
          break;
      }
    }
    print(escolhaia[randomIndex]);
    print(iajogada);
    print(userjogada);
  }

  void reset() {
    setState(() => iajogada = 'images/jokenpo.gif');
    vitoria = 0;
    empate = 0;
    derrota = 0;
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
          child: Text("Pedra Papel Tesoura"),
        ),
      ),
      body:
          //↓↓↓codigo↓↓↓
          Column(
        //↓↓↓ atribute collumn
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  'Vitorias: $vitoria',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                width: 100,
                height: 60,
                color: Colors.amber,
                child: Text(
                  'Empates: $empate',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                width: 100,
                height: 60,
                color: Colors.amber,
                child: Text(
                  'Derrotas: $derrota',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          //
          Expanded(
            flex: 2,
            child: FittedBox(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                Image.asset(
                  imagem,
                ),
              ]),
            ),
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 120,
                height: 80,
                child: ElevatedButton(
                  onPressed: () => escolhido('pedra'),
                  child: Text(
                    'Pedra',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 120,
                height: 80,
                child: ElevatedButton(
                  onPressed: () => escolhido('papel'),
                  child: Text(
                    'Papel',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 120,
                height: 80,
                child: ElevatedButton(
                  onPressed: () => escolhido('tesoura'),
                  child: Text(
                    'Tesoura',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
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
