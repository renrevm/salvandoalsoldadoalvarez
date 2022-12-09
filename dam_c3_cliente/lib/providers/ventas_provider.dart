import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class VentasProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getVenta() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/ventaentradas'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregarVenta(
      String codevento, String cod_cliente, int total) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/ventaentradas'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'codevento': codevento,
        'cod_cliente': cod_cliente,
        'total': total,
      }),
    );

    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> getVentaEntrada(
      String cod_evento) async {
    var respuesta =
        await http.get(Uri.parse(apiURL + '/eventos/' + cod_evento));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }
}
