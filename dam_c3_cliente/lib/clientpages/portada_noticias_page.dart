// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PortadaNoticiasPage extends StatefulWidget {
  const PortadaNoticiasPage({key});

  @override
  State<PortadaNoticiasPage> createState() => _PortadaNoticiasPageState();
}

class _PortadaNoticiasPageState extends State<PortadaNoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portada de interes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              'Noticias de la empresa: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              child: Row(
                children: [
                  Text('Aceptar'),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onPressed: () => {},
            ),
            ElevatedButton(
              child: Text('Volver al menu anterior'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
