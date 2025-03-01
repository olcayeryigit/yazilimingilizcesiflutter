import 'package:flutter/material.dart';
import 'package:yazilimingilizcesi/services/User/register_user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String responseMessage = ""; // API yanıtını tutacak değişken

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Kullanıcıyı kaydetme fonksiyonu
  void _registerUser() async {
    // Boş alanları kontrol et
    if (usernameController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      setState(() {
        responseMessage = "Lütfen tüm alanları doldurun."; // Hata mesajı
      });
      return; // Formu gönderme, çünkü bir alan eksik
    }

    // E-posta formatı geçerli mi kontrol et
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(emailController.text)) {
      setState(() {
        responseMessage = "Geçersiz e-posta formatı."; // Hata mesajı
      });
      return;
    }

    // Şifre en az 6 karakter olmalı
    if (passwordController.text.length < 6) {
      setState(() {
        responseMessage = "Şifre en az 6 karakter olmalıdır."; // Hata mesajı
      });
      return;
    }

    // Kullanıcı adı en az 3 karakter olmalı
    if (usernameController.text.length < 3) {
      setState(() {
        responseMessage = "Kullanıcı adı en az 3 karakter olmalıdır."; // Hata mesajı
      });
      return;
    }

    // Şifre ve şifre tekrarının eşleşip eşleşmediğini kontrol et
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        responseMessage = "Şifreler uyuşmuyor."; // Hata mesajı
      });
      return; // Şifreler uyuşmuyor, formu gönderme
    }

    // Kullanıcıyı kaydet
    String result = await RegisterUser().registerUser(
      username: usernameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    
    setState(() {
      responseMessage = result; // API yanıtını state'e kaydediyoruz
    });

    // SnackBar ile bilgi vermek isterseniz:
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Üye Ol")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Üye Ol",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Kullanıcı adı açıklama ve alanı
            const Text("Kullanıcı adı (en az 3 karakter):"),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),

            // İsim açıklama ve alanı
            const Text("İsim:"),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),

            // Soyisim açıklama ve alanı
            const Text("Soyisim:"),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),

            // E-posta açıklama ve alanı
            const Text("E-posta:"),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),

            // Şifre açıklama ve alanı
            const Text("Şifre (en az 6 karakter):"),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // Şifre tekrar açıklama ve alanı
            const Text("Şifre Tekrar:"),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // Kayıt ol butonu
            Center(
              child: ElevatedButton(
                onPressed: _registerUser, // API'yi çağırıyoruz
                child: const Text("Kayıt Ol"),
              ),
            ),
            const SizedBox(height: 10),

            // Zaten hesabı olanlar için giriş yapma yönlendirmesi
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: const Text("Zaten hesabın var mı? Giriş Yap"),
              ),
            ),
            const SizedBox(height: 20),

            // API yanıtı
            if (responseMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  responseMessage,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red, // Hata mesajı kırmızı renkte
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
