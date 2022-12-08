
import 'package:flutter/material.dart';

import 'nav_bar_superior_comps.dart';




class CartelBorrarComps extends StatefulWidget {
  const CartelBorrarComps({key});

  @override
  State<CartelBorrarComps> createState() => _CartelBorrarCompsState();
}

class _CartelBorrarCompsState extends State<CartelBorrarComps> {
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

  Widget cabecera(){
    return Stack(
          children: <Widget>[
            Image.network('https://i.pinimg.com/736x/83/03/5c/83035cb67cd2661b75df7c23ee489154.jpg',
            height: 600.0,
            fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: 600.0,      
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black38,
                    Colors.black,
                  ]
                )
              ),
            ),
            SafeArea(
              child: NavBarSuperiorComps()
              ),
          ],
        );
  }

  Widget Info(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('PUNTO',style: TextStyle(color: Colors.white,
        fontSize: 16.0,
        
        ),
        ),
        SizedBox(width: 5.0,),
        Icon(Icons.fiber_manual_record, color: Colors.purple, size: 5.0,),
        Text('TIKETEK',style: TextStyle(color: Colors.white,
        fontSize: 16.0,
        
        ),
        
        ),
        SizedBox(width: 5.0,),
        Icon(Icons.fiber_manual_record, color: Colors.purple, size: 5.0,),
        Text('MASTER',style: TextStyle(color: Colors.white,
        fontSize: 16.0,
        
        ),
        ),
        SizedBox(width: 5.0,),
        Icon(Icons.fiber_manual_record, color: Colors.purple, size: 5.0,),
    ],

  );
}

Widget botonera(){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton.icon(
          style: ButtonStyle(
                    foregroundColor: getColor(Colors.white, Colors.yellow),
                    backgroundColor: getColor(Color.fromARGB(255, 140, 25, 155), Colors.black),
                  ),
          
          onPressed: (){
             
          },
          
          icon: Icon(Icons.delete_forever,color: Colors.black,),
          label: Text('Eliminar'),
          
          ),
      ],
    ),
    
  );
}

Widget botonera2(){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton.icon(
          style: ButtonStyle(
                    foregroundColor: getColor(Colors.white, Colors.yellow),
                    backgroundColor: getColor(Color.fromARGB(255, 140, 25, 155), Colors.black),
                  ),
          
          onPressed: (){
             Navigator.pop(context);
                
          },
          
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          label: Text('Volver al Menu anterior'),
          
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