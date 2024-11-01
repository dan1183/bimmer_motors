import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/articles_screen.dart';
import 'screens/parts_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(BimmerMotorsApp());
}

class BimmerMotorsApp extends StatelessWidget {
  BimmerMotorsApp({super.key});

// Асинхронная функция, которая возвращает Future<String>
  Future<String> getMessage() async {
    // Задержка в 3 секунды для эмуляции длительной операции
    await Future.delayed(const Duration(seconds: 3));
    return 'Сообщение получено';
  }

// Асинхронная функция, обрабатывающая результат getMessage
  Future<void> doWork() async {
    try {
      // Ожидание завершения getMessage с результатом в переменной message
      String message = await getMessage();
      if (kDebugMode) {
        print(message);
      }
    } catch (error) {
      if (kDebugMode) {
        print("Произошла ошибка: $error");
      }
    }
  }

  void main() async {
    await doWork();
  }



  // Конфигурация GoRouter с маршрутизацией для каждого экрана
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child); // Корневой экран с BottomNavigationBar
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()), // Домашний экран
          ),
          GoRoute(
            path: '/articles',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ArticlesScreen()), // Статьи
          ),
          GoRoute(
            path: '/parts',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: PartsScreen()), // Запчасти
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ProfileScreen()), // Профиль
          ),
          GoRoute(
            path: '/contact',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ContactScreen()), // Контакты
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Bimmer Motors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Текущий выбранный индекс

  // Сопоставляем индексы BottomNavigationBar с маршрутами GoRouter
  final List<String> _routes = [
    '/',
    '/articles',
    '/parts',
    '/profile',
    '/contact',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    context.go(_routes[index]); // Используем GoRouter для навигации
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child, // Рендерим текущий экран, переданный GoRouter
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Статьи'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Запчасти'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Контакты'),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
