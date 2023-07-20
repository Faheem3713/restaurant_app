import 'package:flutter/material.dart';
import 'package:task_1/constants/app_constants.dart';
import 'package:task_1/views/home/home_screen.dart';

import '../../controllers/data_services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final ValueNotifier<bool> isCheckBox = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    DataServices.instance.getData();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
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
                  controller: emailController,
                  text: 'User Name',
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                kHeight10,
                CustomTextField(
                  controller: passwordController,
                  validator: (val) {
                    if (val == null) {
                      return 'invalid password';
                    } else if (val.length < 6) {
                      return 'Enter minimum 6 character';
                    } else {
                      return null;
                    }
                  },
                  text: 'Password',
                  isObscure: true,
                ),
                Row(
                  children: [
                    ValueListenableBuilder(
                        valueListenable: isCheckBox,
                        builder: (context, value, _) {
                          return Checkbox(
                            value: value,
                            onChanged: (value) {
                              isCheckBox.value = value!;
                            },
                          );
                        }),
                    const Text('Remember Me'),
                    const Spacer(),
                    const Text(
                      'Forgot password.?',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        DataServices.instance.addEmail(emailController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                      }
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
      required this.text,
      required this.controller});
  final String? Function(String?)? validator;
  final bool isObscure;
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
