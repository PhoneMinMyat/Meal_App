import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/category_meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/Category_Meals_Screen';
  // final String categoryId;
  // final String categoryName;
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = routeArg['id']!;
    final String categoryName = routeArg['title']!;
    final categoryMeals = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var indexCategoryMeals = categoryMeals[index];
          return CategoryMealItem(
              id: indexCategoryMeals.id,
              title: indexCategoryMeals.title,
              imageUrl: indexCategoryMeals.imageUrl,
              duration: indexCategoryMeals.duration,
              complexity: indexCategoryMeals.complexity,
              affordability: indexCategoryMeals.affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
