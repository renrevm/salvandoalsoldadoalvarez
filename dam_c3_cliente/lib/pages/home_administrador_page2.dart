import 'package:dam_c3_cliente/adminpages/portada_noticias_page.dart';
import 'package:flutter/material.dart';

import '../adminpages/cambiar_estado_eventos_page.dart';
import '../adminpages/informacion_eventos_page.dart';
import '../adminpages/listar_eventos_try_page.dart';
import '../adminpages/publicar_noticias_page.dart';
import 'menu_page.dart';

class HomeAdministradorPage2 extends StatefulWidget {
  String nombre, correo, url;
  HomeAdministradorPage2(this.nombre, this.correo, this.url);

  @override
  State<HomeAdministradorPage2> createState() => _HomeAdministradorPage2State();
}

class _HomeAdministradorPage2State extends State<HomeAdministradorPage2> {
  int paginaSel = 0;
  final paginas = [
    PortadaNoticiasPage(),
    ListarEventosTryPage(),
    CambiarEstadoEventosPage(),
    InformacionEventosPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),
        backgroundColor: Color.fromARGB(255, 235, 30, 75),
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
        selectedItemColor: Color.fromARGB(255, 235, 30, 75),
        iconSize: 25.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper), label: 'Noticias'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop), label: 'Listar Eventos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Cambiar Estado'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Informacion'),
        ],
      ),
    );
  }
}
