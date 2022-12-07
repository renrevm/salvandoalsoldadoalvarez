// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/pages/menu_page.dart';
import 'package:flutter/material.dart';

class BorrarEventosPage extends StatefulWidget {

  String nombre, correo, url;
  BorrarEventosPage(this.nombre, this.correo, this.url);

  @override
  State<BorrarEventosPage> createState() => _BorrarEventosPageState();
}

class _BorrarEventosPageState extends State<BorrarEventosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrar Evento'),
      ),
      drawer: MenuPage(widget.nombre, widget.correo, widget.url),
      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://i.pinimg.com/originals/f4/e8/70/f4e870d0bbbd41caa5b6960c7f549200.png",
                  ),
                  fit: BoxFit.cover),
            ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                'Evento',
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
      ),
    );
  }
}
