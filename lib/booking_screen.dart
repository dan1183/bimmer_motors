import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Запись на сервис'),
      ),
      body: Center(
        child: const Text('Форма записи будет здесь'),
      ),
    );
  }
}
