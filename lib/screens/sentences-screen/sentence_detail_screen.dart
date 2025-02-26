import 'package:flutter/material.dart';

class SentenceDetailScreen extends StatelessWidget {
  final int bolum;
  const SentenceDetailScreen({super.key, required this.bolum});

  @override
  Widget build(BuildContext context) {
    final Map<int, List<Map<String, String>>> sentencesByBolum = {
      1: [
        {"The server responded with an error code.": "Sunucu bir hata kodu ile yanıt verdi."},
        {"We need to optimize the query for better performance.": "Sorguyu daha iyi performans için optimize etmemiz gerekiyor."},
      ],
      2: [
        {"The API endpoint is not responding.": "API uç noktası yanıt vermiyor."},
        {"Ensure the database connection is active.": "Veritabanı bağlantısının aktif olduğundan emin olun."},
      ],
      // Diğer bölümler için veriler eklenebilir.
    };

    final List<Map<String, String>> sentences = sentencesByBolum[bolum] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text("Bölüm $bolum")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sentences.length,
        itemBuilder: (context, index) {
          String sentence = sentences[index].keys.first;
          String turkishMeaning = sentences[index][sentence]!;

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(sentence, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(turkishMeaning, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            ),
          );
        },
      ),
    );
  }
}
