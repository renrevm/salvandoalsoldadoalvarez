import 'package:flutter/material.dart';

class ItemImagenComps extends StatelessWidget {
  const ItemImagenComps({key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network('https://www.xtrafondos.com/descargar.php?id=5498&vertical=1',
        width: 100.0,
        fit: BoxFit.cover,
        ),

        SizedBox(width: 10.0,)
      ],
    );
  }
}