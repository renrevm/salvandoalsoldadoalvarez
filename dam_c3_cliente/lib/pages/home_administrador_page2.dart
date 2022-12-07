import 'package:dam_c3_cliente/adminpages/portada_noticias_page.dart';
import 'package:dam_c3_cliente/constant.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../adminpages/informacion_eventos_page.dart';
import '../adminpages/listar_eventos_try_page.dart';
import 'menu_page.dart';

// ignore: must_be_immutable
class HomeAdministradorPage2 extends StatefulWidget {
  //const ListarEventosTryPage({key});
  String nombre, correo, url;
  HomeAdministradorPage2(this.nombre, this.correo, this.url);

  @override
  State<HomeAdministradorPage2> createState() => _HomeAdministradorPage2State();
}

class _HomeAdministradorPage2State extends State<HomeAdministradorPage2> {
  int paginaSel = 1;
  final paginas = [
    ListarEventosTryPage(),
    PortadaNoticiasPage(),
    //CambiarEstadoEventosPage(),
    InformacionEventosPage()
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
                Icons.list,
                color: Color(kAccentColor1),
              ),
              label: 'Listado Entradas'),
        ],
      ),
    );
  }
}
