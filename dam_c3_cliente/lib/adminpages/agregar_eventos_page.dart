// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constant.dart';
import '../providers/eventos_provider.dart';

class AgregarEventosPage extends StatefulWidget {
  const AgregarEventosPage({key});

  @override
  State<AgregarEventosPage> createState() => _AgregarEventosPageState();
}

class _AgregarEventosPageState extends State<AgregarEventosPage> {
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();
  TextEditingController estadoCtrl = TextEditingController();

  String errCodigo = '';
  String errNombre = '';
  String errPrecio = '';
  String errEstadp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agregar Evento',
          style: kTituloAppbar,
        ),
        backgroundColor: Color(kPrimaryColor),
        shadowColor: Color(kPrimaryColor),
      ),
      body: Stack(
        children: <Widget>[
          Image.network(
            "https://images.alphacoders.com/971/971255.jpg",
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
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              child: ListView(
                children: [
                  campoCodigo(),
                  mostrarError(errCodigo),
                  campoNombre(),
                  mostrarError(errNombre),
                  campoPrecio(),
                  mostrarError(errPrecio),
                  // campoEstado(),
                  // mostrarError(errStock),
                  botonAgregar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container mostrarError(String error) {
    return Container(
      width: double.infinity,
      child: Text(
        error,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  TextFormField campoCodigo() {
    return TextFormField(
      controller: codigoCtrl,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        labelText: 'Código de evento.',
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField campoNombre() {
    return TextFormField(
      controller: nombreCtrl,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        labelText: 'Nombre de evento.',
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField campoPrecio() {
    return TextFormField(
      controller: precioCtrl,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        labelText: 'Precio de entrada.',
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField campoEstado() {
    return TextFormField(
      controller: estadoCtrl,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        labelText: 'Estado del evento.',
        labelStyle: TextStyle(color: Colors.white),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Container botonAgregar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(kPrimaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text('Agregar Evento'),
          ],
        ),
        onPressed: () async {
          //caputar datos del form
          String cod_evento = codigoCtrl.text.trim();
          String nom_evento = nombreCtrl.text.trim();
          int precio_entrada = int.tryParse(precioCtrl.text.trim()) ?? 0;
          int estado_evento = int.tryParse(estadoCtrl.text.trim()) ?? 0;

          //enviar por post al api
          var respuesta = await EventosProvider()
              .agregar(cod_evento, nom_evento, precio_entrada, estado_evento);

          //manejar errores
          if (respuesta['message'] != null) {
            var errores = respuesta['errors'];
            errCodigo =
                errores['cod_evento'] != null ? errores['cod_evento'][0] : '';
            errNombre =
                errores['nom_evento'] != null ? errores['nom_evento'][0] : '';
            errPrecio = errores['precio_entrada'] != null
                ? errores['precio_entrada'][0]
                : '';

            setState(() {});
            return;
          }

          //redireccionar a pagina que lista
          Navigator.pop(context);
        },
      ),
    );
  }
}
