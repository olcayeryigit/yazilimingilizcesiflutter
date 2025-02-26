import 'package:flutter/material.dart';

class TextDetailScreen extends StatelessWidget {
  final int bolum;
  const TextDetailScreen({super.key, required this.bolum});

  @override
  Widget build(BuildContext context) {
    final Map<int, List<Map<String, String>>> textsByBolum = {
      1: [
        {"Introduction to Programming": "Programlamaya Giriş"},
        {"Variables and Data Types": "Değişkenler ve Veri Türleri"},
        {"Control Flow": "Kontrol Akışı"},
        {"Functions and Methods": "Fonksiyonlar ve Yöntemler"},
        {"Arrays and Lists": "Diziler ve Listeler"},
      ],
      2: [
        {"Object-Oriented Programming": "Nesne Yönelimli Programlama"},
        {"Inheritance": "Miras Alma"},
        {"Polymorphism": "Çok Biçimlilik"},
        {"Abstraction": "Soyutlama"},
        {"Encapsulation": "Kapsülleme"},
      ],
      3: [
        {"Database Management": "Veritabanı Yönetimi"},
        {"SQL Queries": "SQL Sorguları"},
        {"Normalization": "Normalizasyon"},
        {"Joins in SQL": "SQL'deki Birleştirmeler"},
        {"Indexes and Constraints": "İndeksler ve Kısıtlamalar"},
      ],
      4: [
        {"Debugging and Error Handling": "Hata Ayıklama ve Hata Yönetimi"},
        {"Unit Testing": "Birim Testi"},
        {"Version Control": "Versiyon Kontrolü"},
        {"Continuous Integration": "Sürekli Entegrasyon"},
        {"Deployment": "Yayınlama"},
      ],
      5: [
        {"Web Development Basics": "Web Geliştirme Temelleri"},
        {"HTML and CSS": "HTML ve CSS"},
        {"JavaScript": "JavaScript"},
        {"React Framework": "React Çatısı"},
        {"Node.js": "Node.js"},
      ],
    };

    final List<Map<String, String>> texts = textsByBolum[bolum] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text("Bölüm $bolum")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: texts.length,
        itemBuilder: (context, index) {
          String title = texts[index].keys.first;
          String turkishMeaning = texts[index][title]!;

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(turkishMeaning, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            ),
          );
        },
      ),
    );
  }
}
