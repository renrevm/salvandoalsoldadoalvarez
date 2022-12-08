import 'package:dam_c3_cliente/constant.dart';
import 'package:flutter/material.dart';

import '../adminpages/agregar_eventos_page.dart';
import '../adminpages/borrar_eventos_page.dart';
import '../adminpages/editar_eventos_page.dart';
import 'nav_bar_superior_comps.dart';

class CartelPrincipalComps extends StatefulWidget {
  const CartelPrincipalComps({key});

  @override
  State<CartelPrincipalComps> createState() => _CartelPrincipalCompsState();
}

class _CartelPrincipalCompsState extends State<CartelPrincipalComps> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        this.cabecera(),
        this.Info(),
        this.botonera(),
        this.botonera2(),
      ],
    );
  }

  Widget cabecera() {
    return Stack(
      children: <Widget>[
        Image.network(
          'https://assets.puzzlefactory.com/puzzle/393/269/original.jpg',
          height: 500.0,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 500.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Colors.black38,
                Colors.black,
              ])),
        ),
        SafeArea(child: NavBarSuperiorComps()),
      ],
    );
  }

  Widget Info() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'PUNTO',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Color(kPrimaryColor),
          size: 5.0,
        ),
        Text(
          'TIKETEK',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Color(kPrimaryColor),
          size: 5.0,
        ),
        Text(
          'MASTER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Color(kPrimaryColor),
          size: 5.0,
        ),
      ],
    );
  }

  Widget botonera() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton.icon(
            style: ButtonStyle(
              foregroundColor: getColor(Colors.white, Colors.yellow),
              backgroundColor: getColor(Color(kTerciaryColor), Colors.black),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AgregarEventosPage()));
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: Text('Agregar Evento'),
          ),
          /*ElevatedButton.icon(
            style: ButtonStyle(
              foregroundColor: getColor(Colors.white, Colors.yellow),
              backgroundColor: getColor(Color(kTerciaryColor), Colors.black),
            ),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditarEventosPage(
                    
                  ))),
            },
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            label: Text('Editar Evento'),
          ),*/
        ],
      ),
    );
  }

  Widget botonera2() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton.icon(
            style: ButtonStyle(
              foregroundColor: getColor(Colors.white, Colors.yellow),
              backgroundColor: getColor(Color(kTerciaryColor), Colors.black),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BorrarEventosPage()));
            },
            icon: Icon(
              Icons.delete,
              color: Colors.black,
            ),
            label: Text('Borrar Evento'),
          ),
        ],
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
