import 'package:flutter/material.dart';
class NavigationUtil {
  // Generic method to push a new route
  static void navigateTo(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  // Generic method to replace the current route
  static void navigateToAndReplace(BuildContext context, Widget destination) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }
}