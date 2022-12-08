import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyectoclon/ADMIN/agregar_eventos_page.dart';
import 'package:proyectoclon/ADMIN/editar_eventos_page.dart';
import 'package:proyectoclon/providers/productos_provider.dart';

class EventosListarPage extends StatefulWidget {
  const EventosListarPage({Key? key}) : super(key: key);

  @override
  State<EventosListarPage> createState() => _EventosListarPageState();
}

class _EventosListarPageState extends State<EventosListarPage> {
  final fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      body: FutureBuilder(
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
                startActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.purple,
                      icon: Icons.edit,
                      label: 'Editar',
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.blue,
                      icon: Icons.file_open,
                      label: 'Archivar',
                    ),
                  ],
                ),
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
                  leading: Icon(MdiIcons.cube),
                  title: Text('${evento['nom_evento']}'),
                  subtitle: Text('Estado Evento: ${evento['estado_evento']}'),
                  trailing: Text(
                    '\$' + fPrecio.format(evento['precio_entrada']),
                  ),
                  onLongPress: () {
                    //editar
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) =>
                          EditarEventosPage(evento['cod_evento']),
                    );
                    Navigator.push(context, route).then((valor) {
                      setState(() {});
                    });
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
