import 'dart:convert'; // Importa a lib q codifica e decodifica json
import 'package:http/http.dart' as http; // Importe o pacote http
import 'package:flutter/foundation.dart'; // Importe para usar kDebugMode

class CatImageFetcher {
  static Future<List<dynamic>> fetchCatImages() async {
    final url = Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10');

    try {
      final response = await http.get(url);

      if (kDebugMode) { // Verifique se está em modo de depuração, pode ser retirado após os testes
        print('Código de status da API de gatos: ${response.statusCode}');
        print('Corpo da resposta da API de gatos: ${response.body}');
      }

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Falha ao carregar imagens de gatos. Código de status: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode){
        print('Erro na requisição da API de gatos: $e');
      }
      throw Exception('Erro na requisição da API de gatos: $e');
    }
  }
}
