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
  //List<String> posicao0 = ['', '', '', '', '', '', '', '', ''];
  //                  a1|a2|a3|b1|b2|b3|c1|c2|c3
  List<List<String>> posicao = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  ////////////////
  int turno = 0;
  int scorex = 0;
  int scoreo = 0;
  int velha = 0;
  ////////////////
  ////////////////
  void resultado() {
    //linha
    for (var i = 0; i < posicao.length; i++) {
      if (posicao[i][0] != '' &&
          posicao[i][0] == posicao[i][1] &&
          posicao[i][0] == posicao[i][2]) {
        if (posicao[i][0] == 'X') {
          scorex++;
          limpeza();
        } else {
          scoreo++;
          limpeza();
        }
      }
    }
    //fileira
    for (var i = 0; i < posicao.length; i++) {
      //linha
      if (posicao[0][i] != '' &&
          posicao[0][i] == posicao[1][i] &&
          posicao[0][i] == posicao[2][i]) {
        if (posicao[0][i] == 'X') {
          scorex++;
          limpeza();
        } else {
          scoreo++;
          limpeza();
        }
      }
    }
    //diagonal
    //['00', '01', '02']
    //['10', '11', '12']
    //['20', '21', '22']
    //diagonal ==>
    if (posicao[0][0] != '' &&
        posicao[0][0] == posicao[1][1] &&
        posicao[0][0] == posicao[2][2]) {
      if (posicao[0][0] == 'X') {
        scorex++;
        limpeza();
      } else {
        scoreo++;
        limpeza();
      }
    }
    //diagonal <==
    if (posicao[0][2] != '' &&
        posicao[0][2] == posicao[1][1] &&
        posicao[0][2] == posicao[2][0]) {
      if (posicao[2][2] == 'X') {
        scorex++;
        limpeza();
      } else {
        scoreo++;
        limpeza();
      }
    }
  }

  /////////////////
  void spot(int x, int y) {
    switch (turno) {
      case 0:
        setState(() {
          turno = 1;
          posicao[x][y] = 'X';
        });
        break;
      case 1:
        setState(() {
          turno = 0;
          posicao[x][y] = 'O';
        });
        break;
      default:
        break;
    }
    resultado();
  }

  ////////////////

  void limpeza() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      turno = 0;
      posicao = [
        ['', '', ''],
        ['', '', ''],
        ['', '', '']
      ];
    });
  }

  void reset() {
    print("Posição:$posicao\nTurno:$turno");
    setState(() {
      scorex = 0;
      scoreo = 0;
    });
    limpeza();
  }

  ///////////////
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
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      appBar: AppBar(
        title: Center(
          child: Text("Jogo da velha"),
        ),
      ),
      body:
          //
          Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ElevatedButton(
                    onPressed: () => spot(0, 0),
                    child: Text(
                      posicao[0][0],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ElevatedButton(
                    onPressed: () => spot(0, 1),
                    child: Text(
                      posicao[0][1],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ElevatedButton(
                    onPressed: () => spot(0, 2),
                    child: Text(
                      posicao[0][2],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ElevatedButton(
                    onPressed: () => spot(1, 0),
                    child: Text(
                      posicao[1][0],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ElevatedButton(
                    onPressed: () => spot(1, 1),
                    child: Text(
                      posicao[1][1],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ElevatedButton(
                    onPressed: () => spot(1, 2),
                    child: Text(
                      posicao[1][2],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ElevatedButton(
                    onPressed: () => spot(2, 0),
                    child: Text(
                      posicao[2][0],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ElevatedButton(
                    onPressed: () => spot(2, 1),
                    child: Text(
                      posicao[2][1],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ElevatedButton(
                    onPressed: () => spot(2, 2),
                    child: Text(
                      posicao[2][2],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 236, 86, 86)),
                      onPressed: () => reset(),
                      child: Text('Reset'))),
              Container(
                  child: Text(
                'Score:\nX: $scorex\nO: $scoreo',
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
            ],
          )
        ],
      ),

      //
    ));
    //
  }
}
