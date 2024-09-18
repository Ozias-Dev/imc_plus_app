import 'package:flutter/material.dart';
import 'package:imc_plus_app/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC Plus App by OziboyDG',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
