import 'package:flutter/material.dart';

import '../clientpages/portada_noticias_page.dart';
import '../clientpages/comprar_entradas_page.dart';
import '../clientpages/listar_entradas_comp_page.dart';
import 'menu_page.dart';

// ignore: must_be_immutable
class HomeClientPage2 extends StatefulWidget {
  String nombre, correo, url;
  HomeClientPage2(this.nombre, this.correo, this.url);
  @override
  State<HomeClientPage2> createState() => _HomeClientPage2State();
}

class _HomeClientPage2State extends State<HomeClientPage2> {
  int paginaSel = 0;
  final paginas = [
    PortadaNoticiasPage(),
    ComprarEntradasPage(),
    ListarEntradasCompPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cliente'),
        backgroundColor: Color.fromARGB(255, 170, 17, 201),
      ),
      drawer: MenuPage(widget.nombre, widget.correo, widget.url),
      body: paginas[paginaSel],
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        type: BottomNavigationBarType.fixed,
        currentIndex: paginaSel,
        onTap: (index) {
          //print('Tap: ' + index.toString()); //Imprime en la consola el index
          setState(() {
            paginaSel = index;
          });
        },
        selectedItemColor: Color.fromARGB(255, 170, 17, 201),
        iconSize: 25.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper), label: 'Noticias'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Eventos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Listado Entradas'),
        ],
      ),
    );
  }
}
