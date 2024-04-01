import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class SelectedMeal extends StatelessWidget {
  const SelectedMeal({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Ingredient:',
            style: TextStyle(
              color: Color.fromARGB(255, 18, 73, 212),
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Steps:",
            style: TextStyle(
              color: Color.fromARGB(255, 18, 73, 212),
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: meal.steps
                .map((step) => Center(
                      child: Text(
                        step,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
