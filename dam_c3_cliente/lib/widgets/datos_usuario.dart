class DatosUsuario {
  static String nombre = '';
  static String correo = '';
  static String fotoUrl = '';
  DatosUsuario(nombre1, correo1, url) {
    correo = correo1;
    nombre = nombre1;
    fotoUrl = url;
  }
  static String getCorreo() {
    return correo;
  }

  static String getnombre() {
    return nombre;
  }

  static String getFotoUrl() {
    return fotoUrl;
  }
}
