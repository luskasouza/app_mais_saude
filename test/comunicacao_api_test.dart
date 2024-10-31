import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Carrega variáveis de ambiente do arquivo .env
  await dotenv.load(fileName: ".env");
  final String BASE_URL =
      dotenv.env['BASE_URL'] ?? 'http://192.168.1.126:8000/api';

  group('API Communication Tests', () {
    test('deve retornar dados se a chamada HTTP for bem-sucedida', () async {
      // Act
      final response = await http.get(Uri.parse('$BASE_URL/data'));

      // Assert
      expect(response.statusCode, 200);
      expect(jsonDecode(response.body), {'titulo': 'api-mais-saude'});
    });

    test('deve lançar uma exceção se a chamada HTTP falhar', () async {
      // Act
      final response = await http.get(Uri.parse('$BASE_URL/invalid-endpoint'));

      // Assert
      expect(response.statusCode, 404);
    });
  });
}
