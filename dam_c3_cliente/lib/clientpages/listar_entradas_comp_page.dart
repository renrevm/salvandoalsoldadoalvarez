// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/clientpages/detalle_entrada_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListarEntradasCompPage extends StatefulWidget {
  const ListarEntradasCompPage({key});

  @override
  State<ListarEntradasCompPage> createState() => _ListarEntradasCompPageState();
}

class _ListarEntradasCompPageState extends State<ListarEntradasCompPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://img2.wallspic.com/crops/1/8/8/2/5/152881/152881-astronauta-amoled-animacion-espacio-de_dibujos_animados-1242x2688.png",
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
                      getColor(Color.fromARGB(255, 140, 25, 155), Colors.black),
                ),
                child: Text('Ver detalle de entrada'),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalleEntradaPage())),
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
