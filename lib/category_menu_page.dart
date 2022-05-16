import 'package:flutter/material.dart';
import 'package:shrine/model/product.dart';

import 'colors.dart';

class CategoryMenuPage extends StatelessWidget {
  const CategoryMenuPage({
    Key? key,
    required this.currentCategory,
    required this.onCategoryTap,
  }) : super(key: key);

  final Categories currentCategory;
  final ValueChanged<Categories> onCategoryTap;
  final List<Categories> _categories = Categories.values;

  Widget _buildCategory(Categories category, BuildContext context) {
    final categoryString =
        category.toString().replaceAll('Categories.', '').toUpperCase();
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
        onTap: (() => onCategoryTap(category)),
        child: category == currentCategory
            ? Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    categoryString,
                    style: theme.textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14.0),
                  Container(
                    width: 70.0,
                    height: 2.0,
                    color: shrinePink400,
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  categoryString,
                  style: theme.textTheme.bodyText1!.copyWith(
                    color: shrineBrown900.withAlpha(153),
                  ),
                  textAlign: TextAlign.center,
                ),
              ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 40.0),
        color: shrinePink100,
        child: ListView(
          children: _categories
              .map((Categories c) => _buildCategory(c, context))
              .toList(),
        ),
      ),
    );
  }
}
