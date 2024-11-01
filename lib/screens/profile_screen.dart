import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = true;
  String _statusMessage = "Загрузка данных профиля...";
  String _userName = "";
  int _userAge = 0;
  String _userPhone = "";

  // Асинхронный метод для загрузки данных профиля с использованием await
  Future<void> loadProfileData() async {
    setState(() {
      _isLoading = true;
      _statusMessage = "Загрузка данных профиля...";
    });

    // Используем await для асинхронной задержки, эмулируя запрос к серверу
    await Future.delayed(const Duration(seconds: 2));

    // После задержки обновляем данные профиля
    setState(() {
      _isLoading = false;
      _userName = "Алексей Петров";
      _userAge = 28;
      _userPhone = "+7 (123) 456-78-90";
      _statusMessage = "Данные профиля успешно загружены!";
    });
  }

  @override
  void initState() {
    super.initState();
    // Загружаем данные профиля при открытии страницы
    loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Индикатор загрузки
          : Center( // Центрирование контента
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_statusMessage),
              const SizedBox(height: 20),
              Text("Имя: $_userName"),
              Text("Возраст: $_userAge"),
              Text("Телефон: $_userPhone"),
            ],
          ),
        ),
      ),
    );
  }
}
