import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/articles_bloc.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesBloc()..add(LoadArticles()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Статьи"),
        ),
        body: BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (context, state) {
            if (state is ArticlesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ArticlesLoaded) {
              return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.articles[index]),
                  );
                },
              );
            } else {
              return const Center(child: Text("Нет данных"));
            }
          },
        ),
      ),
    );
  }
}
