import 'package:dam_c3_cliente/constant.dart';
import 'package:dam_c3_cliente/pages/menu_perfil_page.dart';
import 'package:dam_c3_cliente/widgets/box_degrade.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/authentificator.dart';
import 'login_page.dart';

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
            decoration: boxDegrade,
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
            title: Text('Cerrar Sesion'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              logout(context);
              //logout(context);
            },
          ),
        ],
      ),
    );
  }

  void logout(BuildContext context) async {
    //cerrar sesion en firebase
    await FirebaseAuth.instance.signOut();
    Authentificator().signOutGoogle();
    //redirigir al login
    MaterialPageRoute route =
        MaterialPageRoute(builder: ((context) => LoginPage()));
    Navigator.pushReplacement(context, route);
  }
}
