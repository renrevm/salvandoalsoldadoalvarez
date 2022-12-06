// ignore_for_file: deprecated_member_use
import 'package:dam_c3_cliente/clientpages/comprar_entradas_page.dart';
import 'package:dam_c3_cliente/clientpages/listar_entradas_comp_page.dart';
import 'package:dam_c3_cliente/clientpages/portada_noticias_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/authentificator.dart';
import '../widgets/muestra.dart';
import 'login_page.dart';
import 'menu_page.dart';

// ignore: must_be_immutable
class HomeClientPage extends StatefulWidget {
  //const HomeClientPage({key});
  String nombre, correo, url;
  HomeClientPage(this.nombre, this.correo, this.url);
  @override
  State<HomeClientPage> createState() => _HomeClientPageState();
}

class _HomeClientPageState extends State<HomeClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cliente'),
        backgroundColor: Color.fromARGB(255, 89, 66, 221),
      ),
      drawer: MenuPage(widget.nombre, widget.correo, widget.url),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/736x/60/a2/97/60a297dfc62787d61cec7004521e54b7.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3, //relacion de aspecto
          children: <Widget>[
            muestra(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: getColor(Colors.white, Colors.yellow),
                  backgroundColor:
                      getColor(Color.fromARGB(255, 136, 54, 244), Colors.black),
                ),
                child: Text('Comprar Entradas'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComprarEntradasPage(
                              widget.nombre, widget.correo, widget.url)));
                },

                //color: Colors.purpleAccent,
                //textColor: Colors.white,
              ),
              text:
                  'Muestra el listado de eventos vigentes y sus respectivas entradas para la compra.',
            ),
            muestra(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: getColor(Colors.white, Colors.yellow),
                  backgroundColor:
                      getColor(Color.fromARGB(255, 136, 54, 244), Colors.black),
                ),
                child: Text('Listado de entradas'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListarEntradasCompPage(
                              widget.nombre, widget.correo, widget.url)));
                },
                //color: Colors.purpleAccent,
                //textColor: Colors.white,
              ),
              text:
                  'Muestra el listado de todas las entradas compradas para eventos vigentes o finalizados.',
            ),
            muestra(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: getColor(Colors.white, Colors.yellow),
                  backgroundColor:
                      getColor(Color.fromARGB(255, 136, 54, 244), Colors.black),
                ),
                child: Text(
                  'Ir a portada de noticias',
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PortadaNoticiasPage(
                              widget.nombre, widget.correo, widget.url)));
                },
                //color: Colors.purpleAccent,
                //textColor: Colors.white,
              ),
              text:
                  'Muestra la portada de noticias de la empresa donde encontrara futuros eventos e informacion de entradas.',
            ),
            muestra(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: getColor(Colors.white, Colors.yellow),
                  backgroundColor: getColor(Colors.red, Colors.black),
                ),
                child: Text('Cerrar Sesion'),

                onPressed: () {
                  //logout(context);
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

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getcolor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getcolor);
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
