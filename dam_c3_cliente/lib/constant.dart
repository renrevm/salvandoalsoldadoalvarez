import 'package:flutter/material.dart';

const kBackgroundColor = 0xFFF1F0F3;
//const kPrimaryColor = 0xFF6228A5;
const kPrimaryColor = 0xFF8628F9;
//const kSecundaryColor = 0xFF7439B9;
const kSecundaryColor = 0xFF9A4BFC;
//const kTerciaryColor = 0xFF7E41C6;
const kTerciaryColor = 0xFFAE6EFD;
const kGreyPrimaryColor = 0xFF593E7A;

const kAccentColor1 = 0xFFF1F0F3;

const TextStyle kTituloAppbar = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const TextStyle kSubTituloAppbar = TextStyle(
  color: Colors.grey,
  fontSize: 12,
);
const BoxDecoration kContainerDegrade = BoxDecoration(
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
