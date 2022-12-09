import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EventosProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEventos() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/eventos'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregar(String cod_evento,
      String nom_evento, int precio_entrada, String estado_evento) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/eventos'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'cod_evento': cod_evento,
        'nom_evento': nom_evento,
        'precio_entrada': precio_entrada,
        'estado_evento': estado_evento,
      }),
    );

    return json.decode(respuesta.body);
  }

  //borrar
  Future<bool> borrar(String cod_evento) async {
    var respuesta =
        await http.delete(Uri.parse(apiURL + '/eventos/' + cod_evento));
    return respuesta.statusCode == 200;
  }

  Future<LinkedHashMap<String, dynamic>> getEvento(String cod_evento) async {
    var respuesta =
        await http.get(Uri.parse(apiURL + '/eventos/' + cod_evento));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> editar(
      String cod_evento_act,
      String cod_evento_new,
      String nom_evento,
      int precio_entrada,
      String estado_evento) async {
    var respuesta = await http.put(
      Uri.parse(apiURL + '/eventos/' + cod_evento_act),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'cod_evento': cod_evento_new,
        'nom_evento': nom_evento,
        'precio_entrada': precio_entrada,
        'estado_evento': estado_evento,
      }),
    );
    return json.decode(respuesta.body);
  }
}
