import 'package:flutter/material.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List<String> _articles = [];
  bool _isLoading = true;

  // Метод для загрузки статей с использованием Future API
  Future<void> loadArticles() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3), () {
      _articles = [
        "Статья 1: Обслуживание БМВ",
        "Статья 2: Диагностика БМВ",
        "Статья 3: Все о двигателе N63",
        "Статья 4: Ошибка полного привода",
      ];
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Статьи"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _articles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_articles[index]),
          );
        },
      ),
    );
  }
}
