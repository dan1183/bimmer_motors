import 'package:flutter/material.dart';

class ServiceBookScreen extends StatelessWidget {
  const ServiceBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сервисная книжка'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Возвращаемся на предыдущий экран
          },
        ),
      ),
      body: const Center(
        child: Text('Тут будет информация о сервисных работах'),
      ),
    );
  }
}
