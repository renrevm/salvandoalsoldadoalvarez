class DatosUsuario {
  static String correo = '';
  DatosUsuario(correo1) {
    correo = correo1;
  }
  dynamic getCorreo() {
    return correo;
  }

  static String getCorreo1() {
    return correo;
  }
}
