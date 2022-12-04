// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/adminpages/agregar_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/cambiar_estado_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/informacion_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/listar_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/publicar_noticias_page.dart';
import 'package:dam_c3_cliente/services/authentificator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({key});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('ir a Listar Eventos'),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListarEventosPage())),
              },
            ),
            ElevatedButton(
              child: Text('ir a Cambiar estado de un Evento'),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CambiarEstadoEventosPage())),
              },
            ),
            ElevatedButton(
              child: Text('obtener informacion de eventos'),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InformacionEventosPage())),
              },
            ),
            ElevatedButton(
              child: Text('Publicar noticias para portada'),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PublicarNoticiasPage())),
              },
            ),
            ElevatedButton(
              child: Text('Cerrar sesion'),
              onPressed: () {
                //Navigator.pop(context);
                logout(context);
              },
            ),
          ],
        ),
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
