import 'package:dam_c3_cliente/constant.dart';
import 'package:dam_c3_cliente/providers/eventos_provider.dart';
import 'package:flutter/material.dart';

class EditarEventosPage extends StatefulWidget {
  final String cod_evento;

  EditarEventosPage(this.cod_evento, {Key? key}) : super(key: key);

  @override
  State<EditarEventosPage> createState() => _EditarEventosPageState();
}

//Toggle button
const double width = 400.0;
const double height = 50.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.black54;
const Color normalColor = Colors.white;

class _EditarEventosPageState extends State<EditarEventosPage> {
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nom_eventoCtrl = TextEditingController();
  TextEditingController precio_entradaCtrl = TextEditingController();
  TextEditingController estado_eventoCtrl = TextEditingController();
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
        title: Text('Editar Producto'),
        backgroundColor: Color(kPrimaryColor),
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
                  precio_entradaCtrl.text =
                      producto['precio_entrada'].toString();
                  estado_eventoCtrl.text = producto['estado_evento'].toString();

                  return Form(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'Editando evento: ' + widget.cod_evento,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              campoCodigo(),
                              mostrarError(errCodigo),
                              camponom_evento(),
                              mostrarError(errNombre),
                              campoprecio_entrada(),
                              mostrarError(errPrecio),
                              ToggleButton(),
                              botonEditar(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
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
        labelText: 'C??digo',
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField camponom_evento() {
    return TextFormField(
      controller: nom_eventoCtrl,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        labelText: 'nom_evento',
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField campoprecio_entrada() {
    return TextFormField(
      controller: precio_entradaCtrl,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        labelText: 'precio_entrada',
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField campoestado_evento() {
    return TextFormField(
      controller: estado_eventoCtrl,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        labelText: 'estado_evento',
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
    );
  }

  Container botonEditar() {
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
          String estado_evento = estado;

          //enviar por post al api

          var respuesta = await EventosProvider().editar(widget.cod_evento,
              cod_evento, nom_evento, precio_entrada, estado_evento);

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

          //redireccionar a pagina que lista productos
          Navigator.pop(context);
        },
      ),
    );
  }

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
