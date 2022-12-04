// ignore_for_file: deprecated_member_use
import 'package:dam_c3_cliente/clientpages/comprar_entradas_page.dart';
import 'package:dam_c3_cliente/clientpages/listar_entradas_comp_page.dart';
import 'package:dam_c3_cliente/clientpages/portada_noticias_page.dart';
import 'package:flutter/material.dart';

class HomeClientPage extends StatefulWidget {
  const HomeClientPage({key});

  @override
  State<HomeClientPage> createState() => _HomeClientPageState();
}

class _HomeClientPageState extends State<HomeClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cliente'),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Comprar entradas'),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> ComprarEntradasPage())

                ),
              },
            ),
            RaisedButton(
              child: Text('Listado de entradas compradas'),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> ListarEntradasCompPage())
                ),
              },
            ),
             RaisedButton(
              child: Text('Ir a portada de noticias'),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> PortadaNoticiasPage())
                ),
              },
            ),
             RaisedButton(
              child: Text('Cerrar sesion'),
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