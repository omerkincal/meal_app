import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  final List<Meal> favoriteMeals = [];
  Widget actionIcon = Icon(Icons.favorite_border);
  Widget nonActionIcon = Icon(Icons.favorite);

  void addToFavoriteMeals() {
    favoriteMeals.add(widget.meal);
    setState(() {
      actionIcon = nonActionIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: addToFavoriteMeals,
            icon: actionIcon,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 15),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            for (final ingredient in widget.meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(height: 30),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            for (final step in widget.meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
