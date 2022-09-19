import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de gatinhos, por Cleiane", home: Home())); //Material App
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  int _gatos = 0;
  String _mensagem = "Quantos gatos há na imagem?";
  void _mudarGatos(int delta) {
    setState(() {
      _gatos += delta;
      if (_gatos == 21) {
        _mensagem = "Acertou! 21 gatinhos para alegrar o dia!";
        _gatos = 21;
      } else if (_gatos >= 17 && _gatos <= 21) {
        _mensagem = "Está esquentando, continue tentando!";
        //_gatos = 0;
      } else if(_gatos > 21) {
        _mensagem = "Vixi, tá muito frio!";
        _gatos = 0;
      }else{
        _mensagem = "Vixi, tá muito frio!";
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.purple,            
        ),
        Image.asset(
          "imagens/gatos1.jpg",
          //fit: BoxFit.cover,
          fit: BoxFit.contain,
          height: 1200.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Gatos: $_gatos",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ), //text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    child: const Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _mudarGatos(1);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    child: const Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _mudarGatos(-1);
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:400),
            ),
            Text(
              _mensagem,
              style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20),
            ) //text
          ], //widget
        ) //Column
      ],
    );
  }
}
