// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_c3_cliente/adminpages/publicar_noticias_page.dart';
import 'package:dam_c3_cliente/constant.dart';
import 'package:dam_c3_cliente/widgets/box_degrade.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../clientpages/mostrar_noticia.dart';
import '../services/firestore_service.dart';

// ignore: must_be_immutable
class PortadaNoticiasPage extends StatefulWidget {
  const PortadaNoticiasPage({key});

  @override
  State<PortadaNoticiasPage> createState() => _PortadaNoticiasPageState();
}

class _PortadaNoticiasPageState extends State<PortadaNoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxDegrade,
        child: Column(
          children: [
            Divider(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirestoreService.noticias(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var noticias = snapshot.data!.docs[index];
                      //print('Producto: '+producto.data().toString());
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text(
                              noticias['titulo'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Times New Roman'),
                            ),
                            /*subtitle: Text(
                              noticias['descripcion'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13, fontFamily: 'system-ui'),
                            ),*/
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MostrarNoticia(
                                          noticias['titulo'],
                                          noticias['descripcion'])));
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(kSecundaryColor),
        child: Icon(
          MdiIcons.newspaper,
          color: Color(kAccentColor1),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PublicarNoticiasPage()));
        },
      ),
    );
  }
}
