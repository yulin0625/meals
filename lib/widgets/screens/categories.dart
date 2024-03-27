import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/widgets/screens/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // 在 StatelessWidget 中，context 不能直接使用
  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: 'Some title',
          meals: [],
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availabeleCategories.map((category) => CategoryGridItem(category: category).toList())
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context);
              },
            )
        ],
      ),
    );
  }
}
