// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import '../constant.dart';
import '../providers/eventos_provider.dart';

import 'detalle_compra_page.dart';
import 'detalle_entrada_page.dart';



class ComprarEntradasPage extends StatefulWidget {
  const ComprarEntradasPage({key});

  @override
  State<ComprarEntradasPage> createState() => _ComprarEntradasPageState();
}

class _ComprarEntradasPageState extends State<ComprarEntradasPage> {
  final fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
              Image.network("https://w0.peakpx.com/wallpaper/315/508/HD-wallpaper-astronaut-sherif-cloud-mirror-nice-reflection.jpg",
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
                    Colors.black38,
                    Colors.black,
                  ]
                )
              ),
            ),
          FutureBuilder(
            future: EventosProvider().getEventos(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 1.3,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var evento = snapshot.data[index];
                  return ListTile(
                    leading: Icon(MdiIcons.cube),
                    iconColor: Colors.purpleAccent,
                    title: Text('${evento['nom_evento']}'),
                    textColor: Colors.white,
                    subtitle: Text('Estado Evento: ${evento['estado_evento']}'),
                    trailing: Text(
                      '\$' + fPrecio.format(evento['precio_entrada']),
                      
                    ),
                    onTap: () {
                      Navigator.push(
                            context,
                              MaterialPageRoute(
                                  builder: (context) => DetalleCompraPage(evento['nom_evento'],evento['precio_entrada'])));
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    
    );
  }
}
