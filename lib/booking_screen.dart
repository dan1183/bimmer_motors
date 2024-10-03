import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<String> bookings = [];
  final TextEditingController _controller = TextEditingController();

  void _addBooking() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        bookings.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeBooking(int index) {
    setState(() {
      bookings.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Запись на сервис'),
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bookings[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeBooking(index),
            ),
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Добавить запись',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _addBooking,
            ),
          ],
        ),
      ),
    );
  }
}
