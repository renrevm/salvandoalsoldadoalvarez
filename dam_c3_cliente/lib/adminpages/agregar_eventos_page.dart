// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AgregarEventosPage extends StatefulWidget {
  const AgregarEventosPage({key});

  @override
  State<AgregarEventosPage> createState() => _AgregarEventosPageState();
}

class _AgregarEventosPageState extends State<AgregarEventosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Eventos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Eventos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
           
            
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