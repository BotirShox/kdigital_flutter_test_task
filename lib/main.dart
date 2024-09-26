import 'package:kdigital_test/src/di/main_di.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kdigital_test/src/presentation/ui/character_screen.dart';

void main() {
  MainDI().configure(GetIt.I);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kdigital',
      home: CharactersScreen(),
    );
  }
}