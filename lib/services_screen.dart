import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Наши услуги'),
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('Замена масла')),
          ListTile(title: Text('Диагностика')),
          ListTile(title: Text('Ремонт тормозов')),
          ListTile(title: Text('Замена шин')),
        ],
      ),
    );
  }
}
