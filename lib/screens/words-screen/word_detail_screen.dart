import 'package:flutter/material.dart';

class WordDetailScreen extends StatelessWidget {
  final int bolum;
  const WordDetailScreen({super.key, required this.bolum});

  @override
  Widget build(BuildContext context) {
    // Örnek kelime listesi (her bölümde 10 kelime)
    final Map<int, List<Map<String, String>>> wordsByBolum = {
      1: [
        {"Algorithm": "Algoritma"},
        {"Function": "Fonksiyon"},
        {"Variable": "Değişken"},
        {"Loop": "Döngü"},
        {"Class": "Sınıf"},
        {"Object": "Nesne"},
        {"Array": "Dizi"},
        {"Condition": "Koşul"},
        {"Database": "Veritabanı"},
        {"Framework": "Çerçeve"},
      ],
      2: [
        {"Compile": "Derleme"},
        {"Debug": "Hata Ayıklama"},
        {"Execute": "Çalıştırma"},
        {"Syntax": "Sözdizimi"},
        {"Inheritance": "Miras"},
        {"Polymorphism": "Çok Biçimlilik"},
        {"Encapsulation": "Kapsülleme"},
        {"Concurrency": "Eşzamanlılık"},
        {"Interface": "Arayüz"},
        {"Library": "Kütüphane"},
      ],
      3: [
        {"Dependency": "Bağımlılık"},
        {"Refactoring": "Kod Yeniden Düzenleme"},
        {"Query": "Sorgu"},
        {"Repository": "Depo"},
        {"Token": "Jeton"},
        {"Authentication": "Kimlik Doğrulama"},
        {"Authorization": "Yetkilendirme"},
        {"Exception": "İstisna"},
        {"Abstraction": "Soyutlama"},
        {"Deployment": "Dağıtım"},
      ],
      4: [
        {"Algorithm Complexity": "Algoritma Karmaşıklığı"},
        {"Binary": "İkili"},
        {"Cache": "Önbellek"},
        {"Data Structure": "Veri Yapısı"},
        {"Encryption": "Şifreleme"},
        {"Decryption": "Şifre Çözme"},
        {"Hashing": "Karma"},
        {"Pointer": "Gösterici"},
        {"Recursion": "Özyineleme"},
        {"Virtual Machine": "Sanal Makine"},
      ],
      5: [
        {"Debugging": "Hata Ayıklama"},
        {"Unit Testing": "Birim Testi"},
        {"Version Control": "Versiyon Kontrolü"},
        {"Merge Conflict": "Birleştirme Çakışması"},
        {"Continuous Integration": "Sürekli Entegrasyon"},
        {"Dependency Injection": "Bağımlılık Enjeksiyonu"},
        {"API": "Uygulama Programlama Arayüzü"},
        {"SDK": "Yazılım Geliştirme Kiti"},
        {"CLI": "Komut Satırı Arayüzü"},
        {"Microservices": "Mikro Hizmetler"},
      ],
    };

    final List<Map<String, String>> words = wordsByBolum[bolum] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text("Bölüm $bolum")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: words.length,
        itemBuilder: (context, index) {
          String englishWord = words[index].keys.first;
          String turkishMeaning = words[index][englishWord]!;
          
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(englishWord, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(turkishMeaning, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            ),
          );
        },
      ),
    );
  }
}
