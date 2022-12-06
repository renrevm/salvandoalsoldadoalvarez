// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/adminpages/cambiar_estado_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/informacion_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/listar_eventos_try_page.dart';
import 'package:dam_c3_cliente/adminpages/publicar_noticias_page.dart';
import 'package:dam_c3_cliente/pages/menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/authentificator.dart';
import '../widgets/muestra.dart';
import 'login_page.dart';

// ignore: must_be_immutable
class HomeAdministradorPage extends StatefulWidget {
  //const HomeAdministradorPage({key});
  String nombre, correo, url;
  HomeAdministradorPage(this.nombre, this.correo, this.url);
  @override
  State<HomeAdministradorPage> createState() => _HomeAdministradorPageState();
}

class _HomeAdministradorPageState extends State<HomeAdministradorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),
        backgroundColor: Colors.purple,
      ),
      drawer: MenuPage(widget.nombre, widget.correo, widget.url),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/originals/3e/44/2e/3e442e5eb7f03dbd40a71b70531f4230.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3, //relacion de aspecto
          children: <Widget>[
            muestra(
              child: ElevatedButton(
                child: Text('Listar Eventos'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListarEventosTryPage(
                              widget.nombre, widget.correo, widget.url)));
                },

                //color: Colors.purpleAccent,
                //textColor: Colors.white,
              ),
              text:
                  'Muestra el listado de eventos con sus respectivas entradas disponibles.',
            ),
            muestra(
              child: ElevatedButton(
                child: Text('Cambiar Estado'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CambiarEstadoEventosPage(
                              widget.nombre, widget.correo, widget.url)));
                },
                //color: Colors.purpleAccent,
                //textColor: Colors.white,
              ),
              text:
                  'Cambia el estado de un evento para venta de entradas solo a eventos vigentes.',
            ),
            muestra(
              child: ElevatedButton(
                child: Text(
                  'Informacion de eventos',
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformacionEventosPage(
                              widget.nombre, widget.correo, widget.url)));
                },
                //color: Colors.purpleAccent,
                //textColor: Colors.white,
              ),
              text:
                  'Obtener informacion de eventos tanto vigentes como finalizados respecto a las ventas.',
            ),
            muestra(
              child: ElevatedButton(
                child: Text('Publicar Noticias'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PublicarNoticiasPage(
                              widget.nombre, widget.correo, widget.url)));
                },
                //color: Colors.purpleAccent,
                //textColor: Colors.white,
              ),
              text:
                  'Publicar noticias de eventos o entradas proximas en la portada principal de la aplicacion.',
            ),
            muestra(
              child: ElevatedButton(
                child: Text('Cerrar Sesion'),
                onPressed: () {
                  logout(context);
                },
                //color: Colors.red,
                //textColor: Colors.white,
              ),
              text: '',
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
