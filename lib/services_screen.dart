import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List<String> services = [
    'Замена масла',
    'Диагностика',
    'Ремонт тормозов',
    'Замена шин',
  ];
  final TextEditingController _controller = TextEditingController();

  void _addService() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        services.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeService(int index) {
    setState(() {
      services.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Наши услуги'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(services[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeService(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Добавить услугу',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addService,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
