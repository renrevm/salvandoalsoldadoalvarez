// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MenuOpcionesPage extends StatefulWidget {
  const MenuOpcionesPage({key});

  @override
  State<MenuOpcionesPage> createState() => _MenuOpcionesPageState();
}

class _MenuOpcionesPageState extends State<MenuOpcionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones de cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Nombre de usuario:'),
            Text('Gonzalo'),
            ElevatedButton(
              child: Text('Volver al menu principal'),
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
