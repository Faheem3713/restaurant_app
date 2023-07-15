import 'package:flutter/material.dart';
import 'package:task_1/constants/app_constants.dart';
import 'package:task_1/views/home/home_screen.dart';

import '../../services/data_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    DataServices.instance.getData();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/image/login_pic.png'),
            Text(
              'Log in\nyour account',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            CustomTextField(
              text: 'User Name',
              validator: (p0) {
                return null;
              },
            ),
            kHeight10,
            CustomTextField(
              validator: (p0) {
                return null;
              },
              text: 'Password',
              isObscure: true,
            ),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                const Text('Remember Me'),
                const Spacer(),
                const Text(
                  'Forgot passwort.?',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.validator,
      this.isObscure = false,
      required this.text});
  final String? Function(String?)? validator;
  final bool isObscure;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          hintText: text),
      obscureText: isObscure,
    );
  }
}
