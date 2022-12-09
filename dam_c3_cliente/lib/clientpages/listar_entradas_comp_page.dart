// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import '../constant.dart';
import '../widgets/get_color.dart';
import 'detalle_entrada_page.dart';

// ignore: must_be_immutable
class ListarEntradasCompPage extends StatefulWidget {
  const ListarEntradasCompPage({key});

  @override
  State<ListarEntradasCompPage> createState() => _ListarEntradasCompPageState();
}

class _ListarEntradasCompPageState extends State<ListarEntradasCompPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
            children: <Widget>[
              Image.network("https://wallpapers.com/images/hd/funny-astronaut-sci-fi-aesthetic-rwcwj2xhtbkpp6kd.jpg",
                height: 800.0,
                fit: BoxFit.cover,
                ),
              Container(
                width: double.infinity,
                height: 800.0,      
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black26,
                      Colors.black,
                    ]
                  )
                ),
                child: ListTile(
                    leading: Icon(MdiIcons.ticketConfirmation),
                    iconColor: Color(kSecundaryColor),
                    title: Text(
                      'hola',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    textColor: Colors.white,
                    subtitle: Text(
                      '\$' + ('5000'),
                    ),
                    trailing: Text('Comprada',style: TextStyle(color: Colors.white,fontSize: 22),),
              ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
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
                                      builder: (context) => DetalleEntradaPage(2))),
                            },
                          ),
        
    );

  }

}
