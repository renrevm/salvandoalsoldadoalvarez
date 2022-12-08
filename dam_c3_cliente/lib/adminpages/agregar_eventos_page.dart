// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/providers/eventos_provider.dart';
import 'package:dam_c3_cliente/widgets/box_degrade.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://i.pinimg.com/originals/2e/bc/cd/2ebccd9056ed62454033e76aab235d5f.png",
                ),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 80, left: 20, right: 20, bottom: 200),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(kAccentColor1),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  child: ListView(
                    children: [
                      Divider(
                        height: 30,
                        thickness: 0,
                      ),
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
            ),
          ),
        ));
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
        labelText: 'Código de evento.',
      ),
    );
  }

  TextFormField campoNombre() {
    return TextFormField(
      controller: nombreCtrl,
      decoration: InputDecoration(
        labelText: 'Nombre de evento.',
      ),
    );
  }

  TextFormField campoPrecio() {
    return TextFormField(
      controller: precioCtrl,
      decoration: InputDecoration(
        labelText: 'Precio de entrada.',
      ),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField campoEstado() {
    return TextFormField(
      controller: estadoCtrl,
      decoration: InputDecoration(
        labelText: 'Estado del evento.',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Container botonAgregar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 40,
      decoration: BoxDecoration(
          color: Color(kPrimaryColor), borderRadius: BorderRadius.circular(20)),
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
