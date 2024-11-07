import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/categories_screen.dart';

class Routes {
  static const String login = '/';
  static const String categories = '/categories';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      categories: (context) => CategoriesScreen(),
    };
  }
}
