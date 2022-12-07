// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/adminpages/cambiar_estado_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/informacion_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/listar_eventos_try_page.dart';
import 'package:dam_c3_cliente/adminpages/publicar_noticias_page.dart';
import 'package:dam_c3_cliente/pages/menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../adminpages/portada_noticias_page.dart';
import '../services/authentificator.dart';
import '../widgets/muestra.dart';
import 'login_page.dart';

// ignore: must_be_immutable
class HomeAdministradorPage extends StatefulWidget {
  String nombre, correo, url;
  HomeAdministradorPage(this.nombre, this.correo, this.url);

  @override
  State<HomeAdministradorPage> createState() => _HomeAdministradorPageState();
}

class _HomeAdministradorPageState extends State<HomeAdministradorPage> {
  int paginaSel = 0;
  final paginas = [
    PublicarNoticiasPage(),
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

  void logout(BuildContext context) async {
    //cerrar sesion en firebase
    await FirebaseAuth.instance.signOut();
    Authentificator().signOutGoogle();
    //redirigir al login
    MaterialPageRoute route =
        MaterialPageRoute(builder: ((context) => LoginPage()));
    Navigator.pushReplacement(context, route);
  }
}
