import 'package:flutter/material.dart';

class ItemRedondeadoComps extends StatelessWidget {
  const ItemRedondeadoComps({key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              height: 110.0,
              width: 110.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(110.0),
                border: Border.all(
                  color: Colors.purple,
                  width: 2.0,
                )
              ),
              child: ClipOval(
                child: Image.network(
                  'https://i.pinimg.com/564x/08/43/13/0843138ab95efcf2174692c182cc213a.jpg',
                  fit: BoxFit.cover,
                  ),
                  
                  ),
            ),
            Text('Hola',style: TextStyle(color: Colors.black),)
          ],
        ),
        SizedBox(width: 10.0,)
      ],
    );
  }
}