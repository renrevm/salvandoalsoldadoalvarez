
import 'package:flutter/material.dart';

import '../componentes/cartel_principal_comps.dart';
import '../componentes/item_imagen_comps.dart';
import '../componentes/item_redondeado_comps.dart';
import 'agregar_eventos_page.dart';

class ListarEventosTryPage extends StatefulWidget {
  const ListarEventosTryPage({key});

  @override
  State<ListarEventosTryPage> createState() => _ListarEventosTryPageState();
}

class _ListarEventosTryPageState extends State<ListarEventosTryPage> {
  //int paginaSel = 0;
  //final paginas = [AgregarEventosPage(),EditarEventosPage(), BorrarEventosPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        
        children: <Widget>[
          CartelPrincipalComps(),
        ],
      ),
      //bottomNavigationBar: this.navInferior(),
    );
  }

  // BottomNavigationBar navInferior(){
  //   return BottomNavigationBar(
      
  //     currentIndex: paginaSel,
  //     onTap: (index) {
  //         //print('Tap: ' + index.toString()); //Imprime en la consola el index
  //         setState(() {
  //           paginaSel = index;
  //         });
  //       },
  //     backgroundColor: Colors.black,
  //     type: BottomNavigationBarType.fixed,
  //     selectedItemColor: Color.fromARGB(255, 202, 71, 209),
  //     unselectedItemColor: Colors.white,
  //     iconSize: 25.0,
  //     selectedFontSize: 14.0,
  //     unselectedFontSize: 12.0,
  //     items: <BottomNavigationBarItem>[
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.shop),
  //         label: ('Noticias')         
  //       ),
  //         BottomNavigationBarItem(
  //         icon: Icon(Icons.list),
  //         label: ('Eventos')         
  //       ),
  //         BottomNavigationBarItem(
  //         icon: Icon(Icons.newspaper),
  //         label: ('Entradas')         
  //       ),
  //     ],
  //   );

  

  Widget listahorizontal(String titulo, Widget item, int cantidad){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal:6.0,vertical: 10.0),
          child: Text(
            titulo,
            style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          
          ),),
        ),

          Container(
            height: 110.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cantidad,
              
              itemBuilder: (context, index) {
                return item;
              } ,
            ),
          ),

      ],

    );
  }
}
