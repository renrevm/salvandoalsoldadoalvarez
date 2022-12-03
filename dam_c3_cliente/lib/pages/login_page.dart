import 'package:dam_c3_cliente/constant.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
              Divider(),
              Text(
                '¡¡Bienvenido, seleccione una opción!!',
                style: TextStyle(
                    color: Color(kAccentColor1),
                    fontSize: 22,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500),
              ),
              Divider(),
              ToggleButton(),
              Divider(),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(kAccentColor1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.transparent,
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 20),
                          decoration: InputDecoration(
                              border: InputBorder.none, labelText: 'Correo'),
                        ),
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 20),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Contraseña'),
                                obscureText: true,
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(kBackgroundColor)),
                                onPressed: () {},
                                child: Icon(MdiIcons.eye,
                                    color: Color(kPrimaryColor)),
                              ),
                            ),
                          ],
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
                width: double.infinity,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Color(kSecundaryColor)),
                  child: Text('INICIAR SESIÓN'),
                  onPressed: () {},
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
}
