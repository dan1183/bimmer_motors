import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PartsScreen extends StatelessWidget {
  const PartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем данные из GetIt
    final String categoryName = GetIt.instance<String>();
    final int partsCount = GetIt.instance<int>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Б/у автозапчасти'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Категория: $categoryName', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('Количество запчастей в наличии: $partsCount', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
