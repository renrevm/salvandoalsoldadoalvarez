// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../constant.dart';

// ignore: must_be_immutable
class DetalleEntradaPage extends StatefulWidget {
  //const DetalleEntradaPage({key});
  int entrada;
  String codevento, cod_cliente;
  DetalleEntradaPage(this.entrada, this.codevento, this.cod_cliente);
  @override
  State<DetalleEntradaPage> createState() => _DetalleEntradaPageState();
}

class _DetalleEntradaPageState extends State<DetalleEntradaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Image.network(
              "https://s1.1zoom.me/big0/697/Cosmonauts_American_525870_1280x909.jpg",
              height: 820.0,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: 820.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                    Colors.black26,
                    Colors.black,
                  ])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Color(kAccentColor1),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: QrImage(
                          data: 'http://www.usmentradas.cl/' +
                              widget.entrada.toString(),
                          version: QrVersions.auto,
                          size: 250,
                          gapless: false,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'C??digo del enveto: ' + widget.codevento.toString(),
                            style: TextStyle(
                                fontSize: 20, color: Color(kAccentColor1)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Correo cliente: ' + widget.cod_cliente.toString(),
                            style: TextStyle(
                                fontSize: 20, color: Color(kAccentColor1)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'N??mero de entrada: ' + widget.entrada.toString(),
                            style: TextStyle(
                                fontSize: 20, color: Color(kAccentColor1)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  getColor(Colors.white, Colors.yellow),
                              backgroundColor: getColor(
                                  Color.fromARGB(255, 206, 30, 30),
                                  Colors.black),
                            ),
                            child: Text('Volver al menu anterior'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getcolor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getcolor);
  }
}
