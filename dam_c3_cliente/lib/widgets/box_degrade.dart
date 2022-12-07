import 'package:flutter/material.dart';

import '../constant.dart';

const BoxDecoration boxDegradeTitulo = BoxDecoration(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(80),
    bottomRight: Radius.circular(80),
  ),
  gradient: LinearGradient(
    colors: [
      Color(kPrimaryColor),
      Color(kSecundaryColor),
      Color(kTerciaryColor),
    ],
    stops: [0.3, 0.4, 0.9],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
  ),
);
const BoxDecoration boxDegrade = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(kPrimaryColor),
      Color(kSecundaryColor),
      Color(kTerciaryColor),
    ],
    stops: [0.3, 0.4, 0.9],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
  ),
);
