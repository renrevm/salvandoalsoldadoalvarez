// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PublicarNoticiasPage extends StatefulWidget {
  const PublicarNoticiasPage({key});

  @override
  State<PublicarNoticiasPage> createState() => _PublicarNoticiasPageState();
}

class _PublicarNoticiasPageState extends State<PublicarNoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias para la portada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Noticia', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
           
            
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