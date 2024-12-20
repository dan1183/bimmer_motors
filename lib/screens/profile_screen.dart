import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Заменяем использование AppData на статические данные (можно заменить на источник данных позже)
    const String userName = 'Default User';
    const int userId = 12345;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ФИО: $userName', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('ID: $userId', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}