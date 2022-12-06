import 'package:dam_c3_cliente/constant.dart';
import 'package:dam_c3_cliente/pages/home_administrador_page.dart';
import 'package:dam_c3_cliente/services/authentificator.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_client_page.dart';
// cd a android y .\gradlew signingReport para encontrar huella digital sh1

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

//Toggle button
const double width = 350.0;
const double height = 50.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.black54;
const Color normalColor = Colors.white;

class _LoginPageState extends State<LoginPage> {
  final List<bool> isSelected = [true, false];
  bool esAdmin = true;
  bool ocultarPasswd = true;
  Icon eye = Icon(MdiIcons.eye);
  String error = '';

//Login con correo
  final formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

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
    Firebase.initializeApp();
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: kContainerDegrade,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    color: Colors.transparent,
                    height: 100,
                  ),

                  Text(
                    'PUNTOTICKETEK',
                    style: TextStyle(
                        color: Color(kAccentColor1),
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'MASTER',
                    style: TextStyle(
                        color: Color(kAccentColor1),
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w900),
                  ),

                  Divider(
                    color: Colors.transparent,
                    height: 70,
                  ),

                  //    primary: Color(kTerciaryColor),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.transparent,
            height: 0,
          ),
          Container(
            child: Column(
              children: [
                Image(image: AssetImage('assets/Astronauta.png')),
                Text(
                  '──── Inicio de sesión ────',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 10,
                ),
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(kSecundaryColor),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(MdiIcons.google),
                        Expanded(
                          child: Text(
                            'Google',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      User? user =
                          await Authentificator.iniciarSesion(context: context);
                      print(user?.displayName);
                      print(user?.email);
                      print(user?.photoURL);
                      String nombre = user?.displayName ?? '';
                      String correo = user?.email ?? '';
                      String url = user?.photoURL ?? '';
                      if (user?.email == 'vixopaez2502@gmail.com') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeAdministradorPage(
                                    nombre, correo, url)));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeClientPage(nombre, correo, url)));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//Toggle Button
  Container ToggleButton() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(kGreyPrimaryColor),
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
                esAdmin = true;
              });
            },
            child: Align(
              alignment: Alignment(-1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Administrador',
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
                esAdmin = false;
              });
            },
            child: Align(
              alignment: Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Cliente',
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

  /*void login() async{
    try {
      //intentar hacer login
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );
      // si llego aca credenciales ok
      //guardar user email
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('userEmail', userCredential.user!.email.toString());
      //redirigir al home
      MaterialPageRoute route =MaterialPageRoute(builder: (context) => HomePage());
      Navigator.pushReplacement(context, route);
    } on FirebaseAuthException catch (ex) {
      //si el login falla cae aca
      switch (ex.code) {
        case 'user-not-found':
          error = 'Usuario no existe';
          break;
        case 'wrong-password':
          error = 'Contraseña incorrecta';
          break;
        case 'user-disabled':
          error = 'Cuenta desactivada';
          break;
        default:
          error = ex.message.toString();
          break;
      }
      setState(() {});
    }
  }*/
}
