import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_base.dart';
import 'base_http.dart';
import '../../utils/info_plus.dart';

class AuthHttp extends BaseHttp {
  Future<http.Response> login({
    required String email,
    required String password,
  }) async {
    final url = '${ApiBase.baseUrl}/login';

    InfoPlus infoPlus = InfoPlus();

    final body = json.encode({
      'email': email.toString(),
      'password': password.toString(),
      'device': infoPlus.packageName.toString()
    });

    final response = await post(url, body: body);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }
}
