// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constant.dart';
import '../providers/ventas_provider.dart';
import '../widgets/datos_usuario.dart';
import '../widgets/get_color.dart';
import 'detalle_entrada_page.dart';

// ignore: must_be_immutable
class ListarEntradasCompPage extends StatefulWidget {
  const ListarEntradasCompPage({key});

  @override
  State<ListarEntradasCompPage> createState() => _ListarEntradasCompPageState();
}

class _ListarEntradasCompPageState extends State<ListarEntradasCompPage> {
  final fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');
  //correo cliente
  final correo = DatosUsuario.getCorreo().toString().trim();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Image.network(
              "https://wallpapers.com/images/hd/funny-astronaut-sci-fi-aesthetic-rwcwj2xhtbkpp6kd.jpg",
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
                  ])),
              child: FutureBuilder(
                future: VentasProvider().getVenta(),
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
                      var venta = snapshot.data[index];
                      return ListTile(
                        leading: Icon(MdiIcons.ticketConfirmation),
                        //leading: Text(correo),
                        iconColor: Color(kSecundaryColor),
                        trailing: Text(venta['total'].toString()),
                        title: Text(
                          '${venta['codevento']}',
                          style: TextStyle(fontSize: 17),
                        ),
                        textColor: Colors.white,

                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetalleEntradaPage(
                                      venta['id_venta'],
                                      venta['codevento'],
                                      venta['cod_cliente'])));
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: ElevatedButton(
      //   style: ButtonStyle(
      //     foregroundColor: getColor(Colors.white, Colors.yellow),
      //     backgroundColor:
      //         getColor(Color.fromARGB(255, 140, 25, 155), Colors.black),
      //   ),
      //   child: Text('Ver detalle de entrada'),
      //   onPressed: () => {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => DetalleEntradaPage(2))),
      //   },
      // ),
    );
  }
}
