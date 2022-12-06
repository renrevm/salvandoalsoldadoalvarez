import 'package:dam_c3_cliente/constant.dart';
import 'package:dam_c3_cliente/pages/menu_opciones_page.dart';
import 'package:dam_c3_cliente/pages/menu_perfil_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  //const MenuPage({key});
  String nombre, correo, url;
  MenuPage(this.nombre, this.correo, this.url);
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
            decoration: kContainerDegradeMenu,
            accountName: Text(widget.nombre),
            accountEmail: Text(widget.correo),
            currentAccountPicture: Image(
              image: NetworkImage(widget.url),
            ),
          ),
          ListTile(
            title: Text('Perfil'),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuPerfilPage()));
            },
          ),
          ListTile(
            title: Text('Opciones'),
            leading: Icon(Icons.api),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuOpcionesPage()));
            },
          ),
        ],
      ),
    );
  }
}
