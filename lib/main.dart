import 'package:flutter/material.dart';
import 'package:isar_db_tutorial/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe  Database',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}


