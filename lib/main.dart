import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:task_1/constants/app_constants.dart';
import 'package:task_1/views/auth/login.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
