import 'package:flutter_bloc/flutter_bloc.dart';

// События
// Определяем события, которые могут произойти в ArticlesBloc
abstract class ArticlesEvent {}

class LoadArticles extends ArticlesEvent {} // Событие для загрузки статей

// Состояния
// Определяем возможные состояния, в которых может находиться ArticlesBloc
abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {} // Начальное состояние
class ArticlesLoading extends ArticlesState {} // Состояние загрузки
class ArticlesLoaded extends ArticlesState {
  final List<String> articles;

  // Храним загруженные статьи
  ArticlesLoaded(this.articles);
}

// Bloc
// Создаём ArticlesBloc для управления событиями и состояниями
class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(ArticlesInitial()) {
    on<LoadArticles>(_onLoadArticles); // Обрабатываем событие LoadArticles
  }

  // Метод обработки события LoadArticles
  Future<void> _onLoadArticles(LoadArticles event, Emitter<ArticlesState> emit) async {
    emit(ArticlesLoading()); // Устанавливаем состояние загрузки
    await Future.delayed(const Duration(seconds: 3)); // Симулируем загрузку данных
    emit(ArticlesLoaded([ // Устанавливаем состояние с загруженными данными
      "Статья 1: Обслуживание БМВ",
      "Статья 2: Диагностика БМВ",
      "Статья 3: Все о двигателе N63",
      "Статья 4: Ошибка полного привода",
    ]));
  }
}
