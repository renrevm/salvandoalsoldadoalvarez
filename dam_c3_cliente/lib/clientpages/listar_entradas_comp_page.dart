// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/clientpages/detalle_entrada_page.dart';
import 'package:flutter/material.dart';

class ListarEntradasCompPage extends StatefulWidget {
  const ListarEntradasCompPage({key});

  @override
  State<ListarEntradasCompPage> createState() => _ListarEntradasCompPageState();
}

class _ListarEntradasCompPageState extends State<ListarEntradasCompPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Compra de entradas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Eventos vigentes o finalizados: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
           
            
            RaisedButton(
              child: Text('Ver detalle de entrada'),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> DetalleEntradaPage())
                ),
              },
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
