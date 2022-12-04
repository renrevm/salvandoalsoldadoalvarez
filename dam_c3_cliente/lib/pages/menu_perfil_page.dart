// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MenuPerfilPage extends StatefulWidget {
  const MenuPerfilPage({key});

  @override
  State<MenuPerfilPage> createState() => _MenuPerfilPageState();
}

class _MenuPerfilPageState extends State<MenuPerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion de Perfil'),
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
