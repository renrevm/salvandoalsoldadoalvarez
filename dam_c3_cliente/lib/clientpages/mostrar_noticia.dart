import 'package:dam_c3_cliente/constant.dart';
import 'package:dam_c3_cliente/widgets/box_degrade.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MostrarNoticia extends StatefulWidget {
  //const MostrarNoticia({key});
  String titulo, descripcion;
  MostrarNoticia(this.titulo, this.descripcion);
  @override
  State<MostrarNoticia> createState() => _MostrarNoticiaState();
}

class _MostrarNoticiaState extends State<MostrarNoticia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kPrimaryColor),
      ),
      body: Container(
        width: double.infinity,
        decoration: boxDegrade,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 100),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.titulo,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman'),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.descripcion,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'system-ui',
                          color: Colors.grey)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
