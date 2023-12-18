import 'package:flutter/material.dart';
import 'package:habit/pages/home.dart';
import 'package:hive_flutter/hive_flutter.dart';


const SAVE_KEY_NAME = 'UserLogin';


void main() async {

  await Hive.initFlutter();

  await Hive.openBox("Habit_Database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
