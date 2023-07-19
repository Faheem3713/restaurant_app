import 'package:flutter/material.dart';
import 'package:task_1/controllers/data_services.dart';
import 'package:task_1/views/auth/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: Center(
        child: Image.asset('assets/image/splash.png'),
      ),
    );
  }

  void navigate(BuildContext context) async {
    DataServices.instance.getData();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
  }
}
