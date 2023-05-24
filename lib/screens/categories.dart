import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //Navigator.of(context).push(route) : also u can use like this
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                MealsScreen(title: category.title, meals: filteredMeal)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //ikinci yol map ile: availableCategories.map((category) =>  CategoryGridItem(category: category))
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectedCategory: () {
              _selectedCategory(context, category);
            },
          )
      ],
    );
  }
}
