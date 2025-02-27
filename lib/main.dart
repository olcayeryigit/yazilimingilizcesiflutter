import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // HTTP isteği için
import 'package:yazilimingilizcesi/screens/profile-screen/profile_screen.dart';
import 'screens/home_screen.dart';
import 'widgets/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'VarelaRound',
      ),
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  String _apiResponse = "Henüz API çağrılmadı."; // API yanıtı için

  static final List<Widget> _pages = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 📌 API'yi test eden fonksiyon
  Future<void> testApi() async {
    const String apiUrl = "http://localhost:5000/api/test"; // API adresin

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        setState(() {
          _apiResponse = "API Yanıtı: ${response.body}";
        });
      } else {
        setState(() {
          _apiResponse = "Hata: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _apiResponse = "Bağlantı hatası: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yazılım İngilizcesi",
          style: TextStyle(
            fontFamily: 'Mitr',
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: testApi, // API'yi test eden fonksiyonu çağır
              child: const Text("API'yi Test Et"),
            ),
          ),
          const SizedBox(height: 20),
          Text(_apiResponse, textAlign: TextAlign.center), // API yanıtını göster
        ],
      ),
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
