import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'services_screen.dart';
import 'contact_screen.dart';
import 'booking_screen.dart';
import 'reviews_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bimmer Motors',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/services': (context) => const ServicesScreen(),
        '/contact': (context) => const ContactScreen(),
        '/booking': (context) => const BookingScreen(),
        '/reviews': (context) => const ReviewsScreen(),
      },
    );



  }
}
