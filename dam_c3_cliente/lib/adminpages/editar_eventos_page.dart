// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/pages/menu_page.dart';
import 'package:flutter/material.dart';

class EditarEventosPage extends StatefulWidget {
  String nombre, correo, url;
  EditarEventosPage(this.nombre, this.correo, this.url);

  @override
  State<EditarEventosPage> createState() => _EditarEventosPageState();
}

class _EditarEventosPageState extends State<EditarEventosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Evento'),
      ),
      drawer: MenuPage(widget.nombre, widget.correo, widget.url),

      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://i.pinimg.com/564x/6d/61/91/6d619196b3d70575506c0d2362c0d122.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
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
      ),
    );
  }
}
