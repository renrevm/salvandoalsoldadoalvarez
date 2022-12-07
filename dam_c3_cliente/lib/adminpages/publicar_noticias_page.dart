// ignore_for_file: deprecated_member_use

import 'package:dam_c3_cliente/services/firestore_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PublicarNoticiasPage extends StatefulWidget {
  const PublicarNoticiasPage({key});

  @override
  State<PublicarNoticiasPage> createState() => _PublicarNoticiasPageState();
}

class _PublicarNoticiasPageState extends State<PublicarNoticiasPage> {
  final _formKey = GlobalKey<FormState>();
  final cuerpoController = TextEditingController();
  final tituloController = TextEditingController();
  String errorCuerpo = '';
  String errortitulo = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Escriba los datos de la noticia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(
              height: 60,
              thickness: 0,
            ),
            TextFormField(
              style: TextStyle(fontSize: 20),
              cursorWidth: 0.5,
              controller: tituloController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  hintText: 'Titulo'),
            ),
            Text(errortitulo),
            Divider(
              height: 60,
              thickness: 0,
            ),
            TextFormField(
              style: TextStyle(fontSize: 20),
              controller: cuerpoController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  hintText: 'Cuerpo'),
            ),
            Text(errorCuerpo),
            Divider(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)))),
                    child: Row(
                      children: [
                        Text('Aceptar'),
                        Icon(Icons.check),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        if (tituloController.text == '') {
                          errortitulo = 'Escriba un título';
                        } else {
                          errortitulo = '';
                        }
                        if (cuerpoController.text == '') {
                          errorCuerpo = 'Escriba el cuerpo';
                        } else {
                          errorCuerpo = '';
                        }
                        if (tituloController.text != '' &&
                            cuerpoController.text != '') {
                          String titulo = tituloController.text;
                          String descripcion = cuerpoController.text;
                          FirestoreService().agregar(titulo, descripcion);
                          Navigator.pop(context);
                        }
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)))),
                    child: Row(
                      children: [
                        Text('Cancelar'),
                        Icon(Icons.cancel),
                      ],
                    ),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
