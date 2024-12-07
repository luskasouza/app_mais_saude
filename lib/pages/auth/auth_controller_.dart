import 'dart:convert';
import '../../services/http/auth_http.dart';
import '../../services/my_shared_preferences.dart';

class AuthController extends AuthHttp {
  Future<bool> authLogin(String email, String password) async {
    try {
      print('Iniciando login com email: $email e senha: *****');
      final response = await super.login(email: email, password: password);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['token'] != null && data['user'] != null) {
          final user = data['user'];
          final token = data['token'];

          final userId = int.tryParse(user['id'].toString()) ?? 0;
          final userName = user['name'].toString();
          final tokenApi = token.toString();

          final mySharedPreferences = MySharedPreferences();
          await mySharedPreferences.add(
            id: userId,
            name: userName,
            tokenApi: tokenApi,
          );

          print('Login realizado com sucesso. Token armazenado.');
          return true;
        }
      }

      print('Erro no login: Código de status ${response.statusCode}. Corpo: ${response.body}');
    } catch (e, stackTrace) {
      print('Erro ao tentar realizar o login: $e');
      print('Stack trace: $stackTrace');
    }

    return false;
  }
}
