import 'package:dam_c3_cliente/constant.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  int paginaSel = 1;
  final paginas = [
    ComprarEntradasPage(),
    PortadaNoticiasPage(),
    ListarEntradasCompPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'PUNTOTICKETEK  ',
              style: TextStyle(
                  color: Color(kAccentColor1),
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900),
            ),
            Text(
              'MASTER',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
        backgroundColor: Color(kPrimaryColor),
      ),
      drawer: MenuPage(widget.nombre, widget.correo, widget.url),
      body: paginas[paginaSel],
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Color(kTerciaryColor),
        type: BottomNavigationBarType.fixed,
        currentIndex: paginaSel,
        onTap: (index) {
          //print('Tap: ' + index.toString()); //Imprime en la consola el index
          setState(() {
            paginaSel = index;
          });
        },
        selectedItemColor: Color(kAccentColor1),
        iconSize: 25.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.ticket,
                color: Color(kAccentColor1),
              ),
              label: 'Eventos'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
              color: Color(kAccentColor1),
            ),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.ticketAccount,
                color: Color(kAccentColor1),
              ),
              label: 'Mis Entradas'),
        ],
      ),
    );
  }
}
