import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/Category-Meals_Screen';
  // final String categoryId;
  // final String categoryName;
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = routeArg['id']!;
    final String categoryName = routeArg['title']!;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('Receipes for the category $categoryName'),
      ),
    );
  }
}
