import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingController'lar
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  // Düzenlenebilir durumu tutan değişkenler
  bool _isUsernameEditable = false;
  bool _isEmailEditable = false;
  bool _isNameEditable = false;
  bool _isSurnameEditable = false;

  // Profil güncelleme fonksiyonu
  void _updateProfile(String field) {
    setState(() {
      switch (field) {
        case 'username':
          _isUsernameEditable = false;
          break;
        case 'email':
          _isEmailEditable = false;
          break;
        case 'name':
          _isNameEditable = false;
          break;
        case 'surname':
          _isSurnameEditable = false;
          break;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profil başarıyla güncellendi!')),
    );
  }

  @override
  void dispose() {
    // Controller'ları temizliyoruz
    _usernameController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Güncelleme"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kullanıcı Adı
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Kullanıcı Adı',
                      ),
                      enabled: _isUsernameEditable,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kullanıcı adı boş olamaz';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(_isUsernameEditable ? Icons.check : Icons.edit),
                    onPressed: () {
                      setState(() {
                        _isUsernameEditable = !_isUsernameEditable;
                        if (!_isUsernameEditable) {
                          _updateProfile('username');
                        }
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // E-posta
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'E-posta',
                      ),
                      enabled: _isEmailEditable,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'E-posta boş olamaz';
                        }
                        // E-posta doğrulama
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Geçerli bir e-posta adresi girin';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(_isEmailEditable ? Icons.check : Icons.edit),
                    onPressed: () {
                      setState(() {
                        _isEmailEditable = !_isEmailEditable;
                        if (!_isEmailEditable) {
                          _updateProfile('email');
                        }
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Ad
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Ad',
                      ),
                      enabled: _isNameEditable,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ad boş olamaz';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(_isNameEditable ? Icons.check : Icons.edit),
                    onPressed: () {
                      setState(() {
                        _isNameEditable = !_isNameEditable;
                        if (!_isNameEditable) {
                          _updateProfile('name');
                        }
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Soyad
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _surnameController,
                      decoration: const InputDecoration(
                        labelText: 'Soyad',
                      ),
                      enabled: _isSurnameEditable,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Soyad boş olamaz';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(_isSurnameEditable ? Icons.check : Icons.edit),
                    onPressed: () {
                      setState(() {
                        _isSurnameEditable = !_isSurnameEditable;
                        if (!_isSurnameEditable) {
                          _updateProfile('surname');
                        }
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
