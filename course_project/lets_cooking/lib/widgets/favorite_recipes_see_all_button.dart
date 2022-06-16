import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lets_cooking/models/recipe_details_model.dart';

import '../constants/colors.dart';
import '../constants/hive_boxes_names.dart';
import '../screens/favorite_recipe_screen.dart';

class FavoriteRecipesSeeAllButton extends StatelessWidget {
  const FavoriteRecipesSeeAllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
        Hive.box<RecipeDetailsModel>(HiveBoxesNames.favoriteRecipes)
            .listenable(),
        builder: (context, Box<RecipeDetailsModel> box, _) {
          if (box.values.isEmpty) {
            return const SizedBox.shrink();
          }
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, FavoriteRecipesScreen.routeName);
            },
            child: Row(
              children: [
                Text(
                  'See all',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary50),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary50,
                ),
              ],
            ),
          );
        });
  }
}
