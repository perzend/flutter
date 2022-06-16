import 'package:flutter/material.dart';
import 'package:lets_cooking/states/theme_state.dart';
import 'package:lets_cooking/widgets/favorite_recipes.dart';
import 'package:lets_cooking/widgets/favorite_recipes_see_all_button.dart';
import 'package:lets_cooking/widgets/search_recipes.dart';
import 'package:provider/provider.dart';

import '../models/recipes_model.dart';
import '../widgets/popular_category.dart';
import '../widgets/trend_recipes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {Key? key, required this.trendRecipes, required this.popularRecipes})
      : super(key: key);
  final RecipesModel trendRecipes;
  final Map<String, RecipesModel> popularRecipes;
  static const routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    final stateTheme = context.watch<ThemeState>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Text(
                  'Dark mode',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Switch(
                    value: stateTheme.isDark,
                    onChanged: (value) {
                      if (value) {
                        stateTheme.setDarkTheme();
                      } else {
                        stateTheme.setLightTheme();
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
    'Find best recipe for cooking',
    style: Theme.of(context).textTheme.headline4,
    ),
            const SizedBox(
              height: 16.0,
            ),
            const SearchRecipes(),
            const SizedBox(
              height: 16.0,
            ),
            Text('Trending now 🔥',
                style: Theme.of(context).textTheme.headline5),
            const SizedBox(
              height: 16.0,
            ),
            TrendRecipes(trendRecipes: trendRecipes),
            Text('Popular category',
                style: Theme.of(context).textTheme.headline5),
            const SizedBox(
              height: 16.0,
            ),
            PopularCategory(popularRecipes: popularRecipes),
            const SizedBox(
              height: 24.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Favorite recipe',
                style: Theme.of(context).textTheme.headline5,
              ),
              const FavoriteRecipesSeeAllButton(),
            ]),
            const SizedBox(
              height: 16.0,
            ),
            const FavoriteRecipes(),
          ]),
        ),
      ),
    );
  }
}
