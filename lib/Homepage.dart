import 'package:flutter/material.dart';
import 'package:you_tube_clone/CustomSearchDelegate.dart';
import 'package:you_tube_clone/telas/biblioteca.dart';
import 'package:you_tube_clone/telas/emAlta.dart';
import 'package:you_tube_clone/telas/incricao.dart';
import 'package:you_tube_clone/telas/inicio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
          // opacity: 1 // altera opacidade do icone
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.yellow,
              title: Text("Inicio"),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
              title: Text("Em alta"),
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
            //backgroundColor: Colors.deepOrange,
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
