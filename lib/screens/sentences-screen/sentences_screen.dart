import 'package:flutter/material.dart';
import 'sentence_detail_screen.dart';

class SentencesScreen extends StatelessWidget {
  const SentencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cümleler")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5, // 5 bölüm var
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.library_books, size: 40, color: Colors.blue),
              title: Text("Bölüm ${index + 1}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SentenceDetailScreen(bolum: index + 1)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
