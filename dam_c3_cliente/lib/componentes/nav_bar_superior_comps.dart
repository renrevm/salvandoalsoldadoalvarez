import 'package:flutter/material.dart';

class NavBarSuperiorComps extends StatelessWidget {
  const NavBarSuperiorComps({key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image(image: NetworkImage('https://images.vexels.com/content/214423/preview/astronaut-space-logo-design-44a093.png',)
        ,width: 40.0,
        fit: BoxFit.cover,
        ),
        Text('Listado de Eventos',style: TextStyle(color: Colors.white,
        fontSize: 16.0,
        
        ),),
         



      ],
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

