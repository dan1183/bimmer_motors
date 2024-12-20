import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;
    getIt.registerSingleton<SomeService>(SomeService());

    final someService = getIt.get<SomeService>();

    if (getIt.isRegistered<SomeService>()) {
      final someService = getIt.get<SomeService>();
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная - Bimmer Motors'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(
            child: Text(
              'Добро пожаловать в Bimmer Motors',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          CachedNetworkImage(
            imageUrl: "https://avatars.mds.yandex.net/i?id=374bc2fc9cf934a820b39b4c1df46f4f_l-5232491-images-thumbs&n=13",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 20),
          CachedNetworkImage(
            imageUrl: "https://avatars.mds.yandex.net/i?id=943f54ee2aa81f278074198c57965119f5296843-5247923-images-thumbs&n=13",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}

class SomeService {
}



