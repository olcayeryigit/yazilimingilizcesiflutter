import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> testApi() async {
  final String baseUrl = "http://localhost:5000"; // API adresi

  try {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Sunucudan gelen yanıt: ${data['message']}");
    } else {
      print("Hata: ${response.statusCode}");
    }
  } catch (e) {
    print("Bağlantı hatası: $e");
  }
}
