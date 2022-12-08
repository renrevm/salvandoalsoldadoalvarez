// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';


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
              Image.network("https://w0.peakpx.com/wallpaper/697/90/HD-wallpaper-astronaut-falling-in-black-hole.jpg",
                height: 680.0,
                fit: BoxFit.cover,
                ),
              Container(
                width: double.infinity,
                height: 680.0,      
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
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                       
                        ],
                      ),
                    ),
                  ],
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
