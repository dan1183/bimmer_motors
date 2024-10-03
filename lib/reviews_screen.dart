import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  List<String> reviews = [];
  final TextEditingController _controller = TextEditingController();

  void _addReview() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        reviews.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeReview(int index) {
    setState(() {
      reviews.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Отзывы'),
      ),
      body: ListView.separated(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(reviews[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeReview(index),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Добавить отзыв',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _addReview,
            ),
          ],
        ),
      ),
    );
  }
}
