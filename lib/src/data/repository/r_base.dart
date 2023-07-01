import "package:http/http.dart" as http;

class BaseRepository {
  Map<String, String> headers = {
    "x-api-key": '3Xf3Ol2f.jZTJb4EL8xSo1VlJU1g5UCGcmE62mM6k'
  };
  String urlBase = 'http://localhost:8000/api/v1';

  Future<http.Response> getRequest({
    required String endpoint,
    String search = "",
  }) async {
    return http.get(
      Uri.parse("$urlBase/$endpoint?name=$search"),
      headers: headers,
    );
  }
}
