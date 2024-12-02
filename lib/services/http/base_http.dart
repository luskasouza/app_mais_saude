import 'package:http/http.dart' as http;

abstract class BaseHttp {
  Future<http.Response> post(String url, {Map<String, String>? headers, Object? body}) {
    final defaultHeaders = {
      'Content-Type': 'application/json',
    };

    final mergedHeaders = {
      ...defaultHeaders,
      if (headers != null) ...headers,
    };

    final uri = Uri.parse(url);

    return http.post(uri, headers: mergedHeaders, body: body);
  }
}
