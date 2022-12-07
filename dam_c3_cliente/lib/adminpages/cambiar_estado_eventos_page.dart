// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/pages/menu_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CambiarEstadoEventosPage extends StatefulWidget {
  //const CambiarEstadoEventosPage({key});
  String nombre, correo, url;
  CambiarEstadoEventosPage(this.nombre, this.correo, this.url);
  @override
  State<CambiarEstadoEventosPage> createState() =>
      _CambiarEstadoEventosPageState();
}

class _CambiarEstadoEventosPageState extends State<CambiarEstadoEventosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              'Eventos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              child: Row(
                children: [
                  Text('Aceptar'),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onPressed: () => {},
            ),
            ElevatedButton(
              child: Text('Volver al menu anterior'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
