import 'package:flutter/material.dart';
import 'word_detail_screen.dart';

class WordsScreen extends StatefulWidget {
  const WordsScreen({super.key});

  @override
  _WordsScreenState createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  final int itemsPerPage = 8;  // Sayfa başına gösterilecek öğe sayısı
  int currentPage = 1;          // Başlangıçta 1. sayfa
  final PageController _pageController = PageController();

  final List<String> allSections = List.generate(40, (index) => "Bölüm ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kelimeler")),
      body: Column(
        children: [
          // Sayfa içeriği
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page + 1;
                });
              },
              itemCount: (allSections.length / itemsPerPage).ceil(),
              itemBuilder: (context, index) {
                int startIndex = index * itemsPerPage;
                int endIndex = (index + 1) * itemsPerPage;
                endIndex = endIndex > allSections.length ? allSections.length : endIndex;

                List<String> sectionsForPage = allSections.sublist(startIndex, endIndex);

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: sectionsForPage.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: const Icon(Icons.library_books, size: 40, color: Colors.blue),
                        title: Text(sectionsForPage[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WordDetailScreen(bolum: index + 1)),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          
          // Sayfa numaraları ve ileri/geri butonları
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Geri butonu
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: currentPage > 1
                      ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                ),
                
                // Sayfa numarası
                Text("Sayfa $currentPage", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                
                // İleri butonu
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: currentPage < (allSections.length / itemsPerPage).ceil()
                      ? () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
