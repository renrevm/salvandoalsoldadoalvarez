// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/adminpages/agregar_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/borrar_eventos_page.dart';
import 'package:dam_c3_cliente/adminpages/editar_eventos_page.dart';
import 'package:dam_c3_cliente/pages/menu_page.dart';
import 'package:flutter/material.dart';



class ListarEventosPage extends StatefulWidget {
  const ListarEventosPage({key});

  @override
  State<ListarEventosPage> createState() => _ListarEventosPageState();
}

class _ListarEventosPageState extends State<ListarEventosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Eventos'),
      ),
      drawer: MenuPage(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Eventos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),


            RaisedButton(
              child: Text('Agregar un Nuevo Evento'),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> AgregarEventosPage())
                ),
              },
            ),
            RaisedButton(
              child: Text('Editar un Nuevo Evento'),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> EditarEventosPage())
                ),
              },
            ),
            RaisedButton(
              child: Text('Borrar un Nuevo Evento'),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> BorrarEventosPage())
                ),
              },
            ),
            
            RaisedButton(
              child: Text('Volver al menu principal'),
              onPressed: (){
                Navigator.pop(context);
                
              },
            ),
            
          ],
        ),
      ),
    );
  }
}