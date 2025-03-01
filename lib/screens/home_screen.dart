import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Öğrenmeye Başlayın!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Yazılım dünyasında sıkça kullanılan terimleri ve anlamlarını öğrenin.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Diğer bölümler kaldırıldı

              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Kaldığın yerden devam edebilmek için üye ol veya giriş yap.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Giriş yap ekranına yönlendirme yapılabilir
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text("Giriş Yap"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Üye ol ekranına yönlendirme yapılabilir
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text("Üye Ol"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
