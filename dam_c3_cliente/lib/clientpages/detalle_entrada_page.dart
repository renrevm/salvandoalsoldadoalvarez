// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class DetalleEntradaPage extends StatefulWidget {
  const DetalleEntradaPage({key});

  @override
  State<DetalleEntradaPage> createState() => _DetalleEntradaPageState();
}

class _DetalleEntradaPageState extends State<DetalleEntradaPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjYvXQsPqpLBOcwiuUshopdMydJOwRL-sgeJro5RzyNlqJu9076TgHf46Yiw1VBS_MWz70HNoZgUB1fJcUa3cdncghm3QGQsmtXzUschJnghlyRAEgJQhI2VryH76B1Q_q332MulbpaA7M4YeIcx7cx9lqbb5HZvze4jC-qBNLrVD_L6bOsbEOWmA__iQ/w296-h640/cute-astronaut.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: getColor(Colors.white, Colors.yellow),
                  backgroundColor:
                      getColor(Color.fromARGB(255, 206, 30, 30), Colors.black),
                ),
                child: Text('Volver al menu anterior'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
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
