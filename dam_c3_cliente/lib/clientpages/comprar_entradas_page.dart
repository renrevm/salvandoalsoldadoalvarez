// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../constant.dart';
import '../providers/eventos_provider.dart';
import '../providers/ventas_provider.dart';
import '../widgets/datos_usuario.dart';

class ComprarEntradasPage extends StatefulWidget {
  const ComprarEntradasPage({key});

  @override
  State<ComprarEntradasPage> createState() => _ComprarEntradasPageState();
}

class _ComprarEntradasPageState extends State<ComprarEntradasPage> {
  final fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');
  //correo cliente
  final correo = DatosUsuario.getCorreo().toString().trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.network(
            "https://w0.peakpx.com/wallpaper/315/508/HD-wallpaper-astronaut-sherif-cloud-mirror-nice-reflection.jpg",
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
                ])),
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
                    leading: Icon(MdiIcons.ticketConfirmation),
                    //leading: Text(correo),
                    iconColor: Color(kSecundaryColor),
                    title: Text(
                      '${evento['nom_evento']}',
                      style: TextStyle(fontSize: 17),
                    ),
                    textColor: Colors.white,
                    subtitle: Text(
                      '\$' + fPrecio.format(evento['precio_entrada']),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(kSecundaryColor),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)))),
                      onPressed: () {
                        //Comprar
                        print(correo);
                        confirmDialog(context, evento['nom_evento'])
                            .then((confirma) {
                          if (confirma) {
                            VentasProvider().agregarVenta(evento['cod_evento'],
                                correo, evento['precio_entrada']);
                          }
                        });
                      },
                      child: Text('Comprar'),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context, String evento) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmación compra'),
          content: Text('¿Confirma comprar entrada para el evento $evento?'),
          actions: [
            TextButton(
              child: Text(
                'CONFIRMAR',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () => Navigator.pop(context, true),
            ),
            ElevatedButton(
              child: Text('CANCELAR'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        );
      },
    );
  }
}
