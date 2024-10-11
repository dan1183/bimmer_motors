import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<String> bookings = []; // Список для хранения записей
  final TextEditingController _controller = TextEditingController(); // Контроллер для текстового поля

  void _addBooking() {
    final newBooking = _controller.text.trim(); // Убираем пробелы с начала и конца
    if (newBooking.isNotEmpty) {
      setState(() {
        bookings.add(newBooking); // Добавляем запись в список
        _controller.clear(); // Очищаем текстовое поле
      });

      // Уведомление для Android
      if (kIsWeb || Platform.isAndroid) { // Проверяем, является ли платформа вебом или Android
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Запись "$newBooking" добавлена!'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } else {
      // Сообщение об ошибке, если текстовое поле пустое
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Введите текст записи!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _removeBooking(int index) {
    setState(() {
      bookings.removeAt(index); // Удаляем запись по индексу
    });
  }

  void _clearBookings() {
    setState(() {
      bookings.clear(); // Очищаем все записи
    });
  }

  @override
  Widget build(BuildContext context) {
    // Определяем платформу
    bool isWeb = kIsWeb;
    bool isWindows = !isWeb && !kIsWeb && (Platform.isWindows); // Проверка на Windows
    bool isMobile = !isWeb && (Platform.isAndroid || Platform.isIOS); // Проверка на мобильные платформы

    return Scaffold(
      appBar: AppBar(
        title: const Text('Запись на сервис'),
      ),
      body: Column( // Используем Column для размещения элементов
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bookings[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeBooking(index), // Удаляем запись по нажатию
                  ),
                  tileColor: isWeb ? Colors.grey[300] : null, // Цвет фона для веба
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
                    decoration: InputDecoration(
                      labelText: isWeb
                          ? 'Добавить запись (веб)'
                          : 'Добавить запись',
                      border: isWeb
                          ? OutlineInputBorder()
                          : const UnderlineInputBorder(), // Разные стили для веба
                    ),
                    onSubmitted: (_) => _addBooking(), // Добавление записи по нажатию Enter
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addBooking, // Добавляем запись по нажатию
                ),
              ],
            ),
          ),
          if (isWindows) // Кнопка очистки списка записей только для Windows
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: _clearBookings,
                child: const Text('Очистить все записи'),
              ),
            ),
        ],
      ),
    );
  }
}
