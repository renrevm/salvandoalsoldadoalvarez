// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/pages/menu_page.dart';
import 'package:flutter/material.dart';

class CambiarEstadoEventosPage extends StatefulWidget {
  const CambiarEstadoEventosPage({key});

  @override
  State<CambiarEstadoEventosPage> createState() =>
      _CambiarEstadoEventosPageState();
}

class _CambiarEstadoEventosPageState extends State<CambiarEstadoEventosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar el estado de un Evento'),
      ),
      drawer: MenuPage(),
      body: Padding(
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
