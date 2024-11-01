import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Персональные данные'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Возвращаемся на предыдущий экран
          },
        ),
      ),
      body: const Center(
        child: Text('Тут будет информация о персональных данных'),
      ),
    );
  }
}