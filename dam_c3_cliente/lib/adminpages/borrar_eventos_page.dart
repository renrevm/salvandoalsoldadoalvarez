// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/pages/menu_page.dart';
import 'package:flutter/material.dart';



class BorrarEventosPage extends StatefulWidget {
  const BorrarEventosPage({key});

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
      drawer: MenuPage(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Evento', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
           
            
            RaisedButton(
              child: Row(
                children: [
                  Text('Aceptar'),
                  Icon(Icons.arrow_forward_ios),
                ],

              ),
              onPressed: ()=>{},
               
            ),
             RaisedButton(
              child: Text('Volver al menu anterior'),
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