// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../pages/menu_page.dart';

class DetalleEntradaPage extends StatefulWidget {
  const DetalleEntradaPage({key});

  @override
  State<DetalleEntradaPage> createState() => _DetalleEntradaPageState();
}

class _DetalleEntradaPageState extends State<DetalleEntradaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Entrada'),
      ),
      drawer: MenuPage(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              'Entrada: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
