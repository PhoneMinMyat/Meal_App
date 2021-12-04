import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              caption: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  ),
            ),
        colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
            surface: const Color.fromRGBO(255, 254, 229, 1)),
      ),
      routes: {
        '/': (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.routeName : (ctx) => const CategoryMealsScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meal App'),
        ),
        body: const Center(
          child: Text('Hello'),
        ));
  }
}
