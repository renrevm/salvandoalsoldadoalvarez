import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constant.dart';
import '../providers/eventos_provider.dart';
import 'agregar_eventos_page.dart';
import 'editar_eventos_page.dart';

class ListarEventosPage extends StatefulWidget {
  const ListarEventosPage({Key? key}) : super(key: key);

  @override
  State<ListarEventosPage> createState() => _ListarEventosPageState();
}

class _ListarEventosPageState extends State<ListarEventosPage> {
  final fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

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
                  Colors.black26,
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
                  return Slidable(
                    //action panes
                    // startActionPane: ActionPane(
                    //   motion: ScrollMotion(),
                    //   children: [
                    //     // SlidableAction(
                    //     //   onPressed: (context) {
                    //     //     Navigator.push(
                    //     //         context,
                    //     //         MaterialPageRoute(
                    //     //             builder: (context) => EditarEventosPage(
                    //     //                 evento['cod_evento'])));
                    //     //   },
                    //     //   backgroundColor: Color(kPrimaryColor),
                    //     //   icon: Icons.edit,
                    //     //   label: 'Editar',
                    //     // ),
                    //   ],
                    // ),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            confirmDialog(context, evento['nom_evento'])
                                .then((confirma) {
                              if (confirma) {
                                // borrar
                                EventosProvider()
                                    .borrar(evento['cod_evento'])
                                    .then((fueBorrado) {
                                  if (fueBorrado) {
                                    snapshot.data.removeAt(index);
                                    setState(() {});
                                    mostrarSnackbar(
                                        'Evento ${evento['nom_evento']} borrado');
                                  }
                                });
                              }
                            });
                          },
                          backgroundColor: Colors.red,
                          icon: MdiIcons.trashCan,
                          label: 'Borrar',
                        ),
                      ],
                    ),
                    //ListTile
                    child: ListTile(
                      leading: Icon(MdiIcons.ticketConfirmation),
                      iconColor: Color(kSecundaryColor),
                      title: Text('${evento['nom_evento']}'),
                      textColor: Colors.white,
                      subtitle:
                          Text('Estado Evento: ${evento['estado_evento']}'),
                      trailing: Text(
                        '\$' + fPrecio.format(evento['precio_entrada']),
                      ),
                      onLongPress: () {
                        //editar
                        MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) =>
                              EditarEventosPage(evento['cod_evento']),
                        );
                        Navigator.push(context, route).then((value) {
                          setState(() {});
                        });
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Row(
          children: [
            Icon(Icons.add),
            Icon(MdiIcons.ticketOutline),
          ],
        ),
        backgroundColor: Color(kSecundaryColor),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => AgregarEventosPage(),
          );
          Navigator.push(context, route).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }

  void mostrarSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(mensaje),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context, String evento) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmación de borrado'),
          content: Text('¿Confirma borrar el evento $evento?'),
          actions: [
            TextButton(
              child: Text('CANCELAR'),
              onPressed: () => Navigator.pop(context, false),
            ),
            ElevatedButton(
              child: Text('CONFIRMAR'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
  }
}
