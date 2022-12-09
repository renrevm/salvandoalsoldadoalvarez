// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constant.dart';
import '../providers/eventos_provider.dart';

class AgregarEventosPage extends StatefulWidget {
  const AgregarEventosPage({key});

  @override
  State<AgregarEventosPage> createState() => _AgregarEventosPageState();
}

//Toggle button
const double width = 400.0;
const double height = 50.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.black54;
const Color normalColor = Colors.white;

class _AgregarEventosPageState extends State<AgregarEventosPage> {
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();
  TextEditingController estadoCtrl = TextEditingController();
  String estado = 'Activo';

  String errCodigo = '';
  String errNombre = '';
  String errPrecio = '';
  String errEstadp = '';

  //Toggle Button
  late double xAlign;
  late Color loginColor;
  late Color signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

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
                  ToggleButton(),
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
          String estado_evento = estado;

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

  //Toggle Button
  Container ToggleButton() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(kPrimaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: Duration(milliseconds: 300),
            child: Container(
              width: width * 0.5,
              height: height,
              decoration: BoxDecoration(
                color: Color(kAccentColor1),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = loginAlign;
                loginColor = selectedColor;

                signInColor = normalColor;
                //Admin
                estado = 'Activo';
              });
            },
            child: Align(
              alignment: Alignment(-1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Activo',
                  style: TextStyle(
                    color: loginColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = signInAlign;
                signInColor = selectedColor;

                loginColor = normalColor;
                //Cliente
                estado = 'Inactivo';
              });
            },
            child: Align(
              alignment: Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Inactivo',
                  style: TextStyle(
                    color: signInColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
