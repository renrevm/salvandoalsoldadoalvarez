import 'package:dam_c3_cliente/pages/menu_opciones_page.dart';
import 'package:dam_c3_cliente/pages/menu_perfil_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple  
              ),
              accountName: Text('Gonzalo Alvarez'),
              accountEmail: Text('Gonzalo.alvarezv@usm.cl'),
              currentAccountPicture: Image.asset('assets/gonza.jpg'),
            ),
            ListTile(
              title: Text('Perfil'),
              leading: Icon(Icons.person),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> MenuPerfilPage())      
                );
              },
            ),
             ListTile(
              title: Text('Opciones'),
              leading: Icon(Icons.api),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> MenuOpcionesPage())      
                );

              },
            ),
          ],
        ),
    );
  }
}