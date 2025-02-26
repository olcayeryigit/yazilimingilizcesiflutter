import 'package:flutter/material.dart';
import 'words-screen/words_screen.dart';
import 'sentences-screen/sentences_screen.dart';
import 'texts-screen/texts_screen.dart';

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

              Expanded(
                child: ListView(
                  children: [
                    _buildSectionCard(context, "Kelimeler", Icons.code, const WordsScreen()),
                    _buildSectionCard(context, "Cümleler", Icons.book, const SentencesScreen()),
                    _buildSectionCard(context, "Metinler", Icons.quiz, const TextsScreen()),
                  ],
                ),
              ),

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
                    },
                    child: const Text("Giriş Yap"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Üye ol ekranına yönlendirme yapılabilir
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

  Widget _buildSectionCard(BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
