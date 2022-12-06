// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../pages/menu_page.dart';

// ignore: must_be_immutable
class ComprarEntradasPage extends StatefulWidget {
  //const ComprarEntradasPage({key});
  String nombre, correo, url;
  ComprarEntradasPage(this.nombre, this.correo, this.url);
  @override
  State<ComprarEntradasPage> createState() => _ComprarEntradasPageState();
}

class _ComprarEntradasPageState extends State<ComprarEntradasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comprar entradas'),
      ),
      drawer: MenuPage(widget.nombre, widget.correo, widget.url),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              'entradas para eventos: ',
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
