import 'package:flutter/material.dart';

class muestra extends StatelessWidget {
  final Widget child;
  final String text;

  const muestra({
    Key? key,
    required this.child,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            this.child,
           
            SizedBox(height: 10,),
            Text(
              this.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    ));
  }
}