import 'package:dam_c3_cliente/providers/eventos_provider.dart';
import 'package:flutter/material.dart';

class EditarEventosPage extends StatefulWidget {
  String cod_evento;

  EditarEventosPage(this.cod_evento, {Key? key}) : super(key: key);

  @override
  State<EditarEventosPage> createState() => _EditarEventosPageState();
}

class _EditarEventosPageState extends State<EditarEventosPage> {
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nom_eventoCtrl = TextEditingController();
  TextEditingController precio_entradaCtrl = TextEditingController();
  TextEditingController estado_eventoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: EventosProvider().getEvento(widget.cod_evento),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var producto = snapshot.data;
              codigoCtrl.text = producto['cod_evento'];
              nom_eventoCtrl.text = producto['nom_evento'];
              precio_entradaCtrl.text = producto['precio_entrada'].toString();
              estado_eventoCtrl.text = producto['estado_evento'].toString();

              return Form(
                child: Column(
                  children: [
                    Container(
                      child: Text('Editando producto:' + widget.cod_evento),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          campoCodigo(),
                          camponom_evento(),
                          campoprecio_entrada(),
                          campoestado_evento(),
                          botonEditar(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  TextFormField campoCodigo() {
    return TextFormField(
      controller: codigoCtrl,
      decoration: InputDecoration(
        labelText: 'Código',
      ),
    );
  }

  TextFormField camponom_evento() {
    return TextFormField(
      controller: nom_eventoCtrl,
      decoration: InputDecoration(
        labelText: 'nom_evento',
      ),
    );
  }

  TextFormField campoprecio_entrada() {
    return TextFormField(
      controller: precio_entradaCtrl,
      decoration: InputDecoration(
        labelText: 'precio_entrada',
      ),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField campoestado_evento() {
    return TextFormField(
      controller: estado_eventoCtrl,
      decoration: InputDecoration(
        labelText: 'estado_evento',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Container botonEditar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit),
            Text('Editar Producto'),
          ],
        ),
        onPressed: () async {
          //caputar datos del form
          String cod_evento = codigoCtrl.text.trim();
          String nom_evento = nom_eventoCtrl.text.trim();
          int precio_entrada =
              int.tryParse(precio_entradaCtrl.text.trim()) ?? 0;
          int estado_evento = int.tryParse(estado_eventoCtrl.text.trim()) ?? 0;

          //enviar por post al api
          await EventosProvider().editar(widget.cod_evento, cod_evento,
              nom_evento, precio_entrada, estado_evento);

          //redireccionar a pagina que lista productos
          Navigator.pop(context);
        },
      ),
    );
  }
}
