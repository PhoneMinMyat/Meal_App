import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/mealDetailsScreen';
  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const TitleSection(text: 'Ingredients'),
            const SizedBox(
              height: 8,
            ),
            ContainerSection(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      ),
                  itemCount: selectedMeal.ingredients.length),
            ),
            const SizedBox(
              height: 24,
            ),
            const TitleSection(text: 'Steps'),
            const SizedBox(
              height: 8,
            ),
            ContainerSection(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                  separatorBuilder: (ctx, index) => const Divider(),
                  itemCount: selectedMeal.steps.length),
            ),
            const SizedBox(height: 8,)
          ],
        ),
      ),
    );
  }
}

class ContainerSection extends StatelessWidget {
  final Widget child;
  const ContainerSection({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width * 0.8,
      child: child,
    );
  }
}

class TitleSection extends StatelessWidget {
  final String text;
  const TitleSection({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
