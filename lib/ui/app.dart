import 'package:flutter/material.dart';
import 'package:sprint_1/ui/convertir/convertir.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convertidor de Divisas',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const Convertir(),
    );
  }
}