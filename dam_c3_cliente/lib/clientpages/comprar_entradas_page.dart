// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../pages/menu_page.dart';

class ComprarEntradasPage extends StatefulWidget {
  String nombre, correo, url;
  ComprarEntradasPage(this.nombre,this.correo,this.url);

  @override
  State<ComprarEntradasPage> createState() => _ComprarEntradasPageState();
}

class _ComprarEntradasPageState extends State<ComprarEntradasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPage(widget.nombre, widget.correo, widget.url),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/originals/e7/f7/ce/e7f7ce43165a5fdcbf25739702a15bd3.jpg",
              ),
              fit: BoxFit.cover),
        ),
          ),
        ); 
  }
}