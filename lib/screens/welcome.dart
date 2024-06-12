import 'package:api_implementation/screens/Signup.dart';
import 'package:api_implementation/widgets/button.dart';
import 'package:flutter/material.dart';
import '../Utilities/NavigatorUtil.dart';
import '../widgets/flatButton.dart';
import '../screens/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset('assets/images/books_stacked.png'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Welcome!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(233, 99, 108, 25),
                  fontSize: 30),
            ),
            const Text(
              'Discover, Share, and Fall in Love with Reading Again',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(248, 231, 201, 1),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ButtonWidget(
                text: 'Login',
                onPressedButton: () {
                  NavigationUtil.navigateToAndReplace(context, LoginScreen());
                }),
            const SizedBox(
              height: 30.0,
            ),
            FlatButtonWidget(
              text: 'Sign Up',
              onPressedButton: () {
                NavigationUtil.navigateToAndReplace(context, SignupScreen());
              },
            ),
          ],
        ),
      )
    );
  }
}
