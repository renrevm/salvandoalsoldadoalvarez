import 'package:dam_c3_cliente/constant.dart';
import 'package:dam_c3_cliente/pages/home_administrador_page.dart';
import 'package:dam_c3_cliente/services/authentificator.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      body: Container(
        decoration: kContainerDegrade,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Inicio de sesión',
                style: TextStyle(
                    color: Color(kAccentColor1),
                    fontSize: 40,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900),
              ),
              Divider(
                color: Colors.transparent,
              ),
              Text(
                '¡¡Bienvenido, seleccione una opción!!',
                style: TextStyle(
                    color: Color(kAccentColor1),
                    fontSize: 22,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500),
              ),
              Divider(
                color: Colors.transparent,
              ),
              ToggleButton(),
              Divider(
                color: Colors.transparent,
              ),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(kAccentColor1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Divider(
                        color: Colors.transparent,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Padding(padding: EdgeInsets.all(6)),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 20),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Correo'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Padding(padding: EdgeInsets.all(6)),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 20),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Contraseña'),
                                obscureText: ocultarPasswd,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (!ocultarPasswd) {
                                      ocultarPasswd = true;
                                      eye = Icon(MdiIcons.eye);
                                    } else {
                                      ocultarPasswd = false;
                                      eye = Icon(MdiIcons.eyeOff);
                                    }
                                  });
                                },
                                icon: eye)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.transparent,
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
                  child: Text('INICIAR SESIÓN'),
                  onPressed: () async {
                    User? user =
                        await Authentificator.iniciarSesion(context: context);
                    print(user?.displayName);
                    print(user?.email);
                    print(user?.photoURL);
                    //String? nombre = user?.displayName;
                    //Navegación
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeAdministradorPage()));
                  },
                ),
              ),
              //    primary: Color(kTerciaryColor),
            ],
          ),
        ),
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
