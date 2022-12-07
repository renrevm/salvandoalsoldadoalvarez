// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/adminpages/agregar_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/borrar_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/editar_eventos_page.dart';
import 'package:flutter/material.dart';
import '../widgets/muestra.dart';

// ignore: must_be_immutable
class ListarEventosTryPage extends StatefulWidget {
  const ListarEventosTryPage({key});

  @override
  State<ListarEventosTryPage> createState() => _ListarEventosTryPageState();
}

class _ListarEventosTryPageState extends State<ListarEventosTryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/736x/87/bd/99/87bd99186c153f0edbb2f69cc6cb773b.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3, //relacion de aspecto
          children: <Widget>[
            muestra(
              child: ElevatedButton(
                child: Text('Agregar Evento'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgregarEventosPage()));
                },
                //color: Colors.blueAccent.shade200,
                //textColor: Colors.white,
              ),
              text:
                  'Agregar un evento nuevo, con  sus respectivas entradas a la venta.',
            ),
            muestra(
              child: ElevatedButton(
                child: Text('Editar Evento'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditarEventosPage()));
                },
                //color: Colors.blueAccent.shade200,
                //textColor: Colors.white,
              ),
              text: 'Edita un evento que se encuentre en estado vigente.',
            ),
            muestra(
              child: ElevatedButton(
                child: Text(
                  'Borrar Evento',
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BorrarEventosPage()));
                },
                //color: Colors.blueAccent.shade200,
                //textColor: Colors.white,
              ),
              text:
                  'Elimina un evento y sus entradas disponibles para la venta del listado.',
            ),
          ],
        ),
      ),
    );
  }
}
