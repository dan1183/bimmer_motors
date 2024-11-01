import 'package:flutter/material.dart';

class PartsScreen extends StatelessWidget {
  const PartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Б/у автозапчасти'),
      ),
      body: const Center(
        child: Text('Тут будут б/у автозапчасти'),
      ),
    );
  }
}
