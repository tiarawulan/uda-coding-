import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://192.168.80.247/api_perpustakaan/";

  Future<Map<String, dynamic>> login(String idLibrary, String password) async {
    final response = await http.post(
      Uri.parse("${baseUrl}login.php"),
      body: {
        'id_library': idLibrary,
        'password': password,
      },
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> register(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse("${baseUrl}register.php"),
      body: data,
    );
    return jsonDecode(response.body);
  }
}
