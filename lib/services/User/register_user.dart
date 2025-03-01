import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterUser {
  final String baseUrl = "http://localhost:5000"; // Bilgisayarınızın IP adresi (localhost yerine)

  Future<String> registerUser({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/users/register'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return "Kayıt başarılı!";  // Başarı mesajı
      } else {
        print(response); // Hata verisini konsola yazdır
        final data = jsonDecode(response.body);
        return "Hata: ${data['error']}";  // Hata mesajı
      }
    } catch (e) {
      return "Bağlantı hatası: $e";  // Bağlantı hatası
    }
  }
}
