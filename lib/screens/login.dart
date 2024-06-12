import 'package:api_implementation/screens/Home.dart';
import 'package:api_implementation/widgets/button.dart';
import 'package:api_implementation/widgets/flatButton.dart';
import 'package:api_implementation/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';

import '../Utilities/NavigatorUtil.dart';
import '../Utilities/SnackbarUtil.dart';
import '../apiService/api_service.dart';
import 'Signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiService apiService = ApiService();

  void login() async {
    String username = userNameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      SnackbarUtil.showSnackBar(context, "Please fill in all fields");
      return;
    }

    try {
      final response = await apiService.login(username, password);
      if (response.statusCode == 200) {
        SnackbarUtil.showSnackBar(context, "Login successful!");
        NavigationUtil.navigateToAndReplace(context, Home());
      } else {
        SnackbarUtil.showSnackBar(context, "Failed to login");
      }
    } catch (e) {
      SnackbarUtil.showSnackBar(context, 'An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 70.0,
            ),
            Row(
              children: [
                const Text(
                  'Hello!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(233, 99, 108, 25),
                    fontSize: 30,
                  ),
                ),
                const SizedBox(width: 10),
                // Add some space between the text and the image
                Image.asset(
                  'assets/images/wave.png', // Replace with your image path
                  width: 50, // Set the width as needed
                  height: 50, // Set the height as needed
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              'Welcome back! You have been missed during this time.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(248, 231, 201, 1),
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TextFieldWidget(
              labelText: 'Username',
              textEditingController: userNameController,
              textInputType: TextInputType.text,
              obscureText: false,
            ),
            const SizedBox(
              height: 35,
            ),
            TextFieldWidget(
              labelText: 'Password',
              textEditingController: passwordController,
              textInputType: TextInputType.text,
              obscureText: true,
            ),
            const SizedBox(
              height: 35,
            ),
            ButtonWidget(
                text: 'Login',
                onPressedButton: () {
                  login();
                }),
            const SizedBox(
              height: 70,
            ),
            FlatButtonWidget(
                text: 'New User? Sign Up',
                onPressedButton: () {
                  NavigationUtil.navigateToAndReplace(context, SignupScreen());
                }),
          ],
        ),
      ),
    );
  }
}
