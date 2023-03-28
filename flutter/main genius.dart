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
  ////////////////
  //cor dos botão
  ///////////////
  int botao01a = 255;
  int botao01b = 121;
  int botao01c = 191;
  int botao01d = 248;
  /////
  int botao02a = 255;
  int botao02b = 248;
  int botao02c = 180;
  int botao02d = 121;
  //////
  int botao03a = 255;
  int botao03b = 195;
  int botao03c = 121;
  int botao03d = 248;
  /////
  int botao04a = 255;
  int botao04b = 121;
  int botao04c = 248;
  int botao04d = 136;
  /////
  int fundoa = 255;
  int fundob = 96;
  int fundoc = 125;
  int fundod = 139;
  /////
  int score = 0;
  List<int> sequencia = [];
  int dificuldade = 1;
  List<int> jogador = [];
  int passos = 0;
  ////////////////
  //↓↓↓Funções↓↓↓
  ////////////////

  void victory() async {
    if (listEquals(sequencia, jogador)) {
      setState(() {
        fundoa = 255;
        fundob = 0;
        fundoc = 255;
        fundod = 187;
      });
      await Future.delayed(const Duration(seconds: 2));
      jogador = [];
      //passos = 0;
      //sequencia = [];
      dificuldade++;
      setState(() {
        fundoa = 255;
        fundob = 96;
        fundoc = 125;
        fundod = 139;
        score++;
      });
      print('Dificuldade: $dificuldade');
      play();
    }
  }

  ///////
  void click01() {
    jogador.add(0);
    print('Jogador: $jogador');
    if (jogador[passos] == sequencia[passos]) {
      victory();
    } else {
      reset();
    }
  }

  void click02() {
    jogador.add(1);
    print('Jogador: $jogador');
    if (jogador[passos] == sequencia[passos]) {
      victory();
    } else {
      reset();
    }
  }

  void click03() {
    jogador.add(2);
    print('Jogador: $jogador');
    if (jogador[passos] == sequencia[passos]) {
      victory();
    } else {
      reset();
    }
  }

  void click04() {
    jogador.add(3);
    print('Jogador: $jogador');
    if (jogador[passos] == sequencia[passos]) {
      victory();
    } else {
      reset();
    }
  }

  ////////////
  void piscada(List sequencia) async {
    for (var element in sequencia) {
      await Future.delayed(const Duration(seconds: 1));
      print(element);
      switch (element) {
        case 0:
          setState(() {
            botao01a = 255;
            botao01b = 16;
            botao01c = 102;
            botao01d = 171;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            botao01a = 255;
            botao01b = 121;
            botao01c = 191;
            botao01d = 248;
          });
          break;
        case 1:
          setState(() {
            botao02a = 255;
            botao02b = 187;
            botao02c = 103;
            botao02d = 30;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            botao02a = 255;
            botao02b = 248;
            botao02c = 180;
            botao02d = 121;
          });
          break;
        case 2:
          setState(() {
            botao03a = 255;
            botao03b = 115;
            botao03c = 30;
            botao03d = 176;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            botao03a = 255;
            botao03b = 195;
            botao03c = 121;
            botao03d = 248;
          });
          break;
        case 3:
          setState(() {
            botao04a = 255;
            botao04b = 21;
            botao04c = 171;
            botao04d = 38;
          });
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            botao04a = 255;
            botao04b = 121;
            botao04c = 248;
            botao04d = 136;
          });
          break;
        default:
      }
    }
  }

  /////////////
  ///
  ////////////
  void play() {
    print('Dificuldade: $dificuldade');
    ////
    for (var i = 0 + dificuldade; i <= dificuldade; i++) {
      sequencia.add(Random().nextInt(4));
    }
    ////
    piscada(sequencia);
    print('Sequencia atual: $sequencia');
  }

  ///////
  void reset() async {
    setState(() {
      fundoa = 125;
      fundob = 255;
      fundoc = 60;
      fundod = 0;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      fundoa = 255;
      fundob = 96;
      fundoc = 125;
      fundod = 139;
    });
    setState(() {
      score = 0;
      sequencia = [];
      dificuldade = 1;
      jogador = [];
      passos = 0;
      fundoa = 255;
      fundob = 96;
      fundoc = 125;
      fundod = 139;
    });
  }

  ///////////////
  //↑↑↑Funções↑↑↑
  ///////////////
  @override
  Widget build(BuildContext context) {
    //
    //double width = MediaQuery.of(context).size.width;
    //double heigth = MediaQuery.of(context).size.height;
    ///
    ///
    ///
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(fundoa, fundob, fundoc, fundod),
      appBar: AppBar(
        title: Center(
          child: Text("Genius"),
        ),
      ),
      body:
          //↓↓↓codigo↓↓↓
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 220,
                height: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          botao01a, botao01b, botao01c, botao01d)),
                  onPressed: () => click01(),
                  child: Text(
                    '',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 220,
                height: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          botao02a, botao02b, botao02c, botao02d)),
                  onPressed: () => click02(),
                  child: Text(
                    '',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 220,
                height: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          botao03a, botao03b, botao03c, botao03d)),
                  onPressed: () => click03(),
                  child: Text(
                    '',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 220,
                height: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          botao04a, botao04b, botao04c, botao04d)),
                  onPressed: () => click04(),
                  child: Text(
                    '',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
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
                  'Score: $score',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
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
              Container(
                padding: EdgeInsets.all(10),
                width: 120,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  onPressed: () => play(),
                  child: Text(
                    'Iniciar',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      //↑↑↑codigo↑↑↑
    ));
    //
  }
}
