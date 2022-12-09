import 'package:dam_c3_cliente/widgets/box_degrade.dart';
import 'package:flutter/material.dart';

import '../widgets/get_color.dart';

// ignore: must_be_immutable
class DetalleCompraPage extends StatelessWidget {
  String nombre;
  int precio;
  DetalleCompraPage(this.nombre, this.precio);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comprar Entrada'),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: <Widget>[
          Image.network(
            "https://s2.best-wallpaper.net/wallpaper/1920x1080/1608/Astronaut-in-trouble_1920x1080.jpg",
            height: 750.0,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: 750.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  Colors.black26,
                  Colors.black,
                ])),
            child: Column(
              children: [
                Text(
                  nombre,
                ),
                Text(precio.toString()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: getColor(Colors.white, Colors.yellow),
          backgroundColor:
              getColor(Color.fromARGB(255, 140, 25, 155), Colors.black),
        ),
        child: Text('Confirmar'),
        onPressed: () => {},
      ),
    );
  }
}
