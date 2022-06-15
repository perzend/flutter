import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lets_cooking/constants/colors.dart';
import 'package:lets_cooking/screens/favorite_recipe_screen.dart';
import 'package:lets_cooking/screens/home_screen.dart';
import 'package:lets_cooking/screens/recipe_details_screen.dart';
import 'package:lets_cooking/theme/dark_theme.dart';
import 'package:lets_cooking/theme/light_theme.dart';
import 'package:lets_cooking/theme/theme_state.dart';
import 'package:provider/provider.dart';

import 'constants/text_style.dart';
import 'models/recipe_details_model.dart';
import 'models/recipes_model.dart';
import 'screens/welcome_screen.dart';

var listFavoritesRecipes = <int?> [];

const favoriteRecipesBox = 'favorite_recipes';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeDetailsModelAdapter());
  Hive.registerAdapter(ExtendedIngredientsAdapter());
  Hive.registerAdapter(MeasuresAdapter());
  Hive.registerAdapter(MetricAdapter());

  await Hive.openBox<RecipeDetailsModel>(favoriteRecipesBox);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeState()),
  ], child: const LetsCookingApp()));
}

class LetsCookingApp extends StatelessWidget {
  const LetsCookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Consumer<ThemeState>(builder: (context, stateTheme, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Let\'s Cooking',
          themeMode: stateTheme.theme,
          theme: lightTheme,
          darkTheme: darkTheme,
          initialRoute: WelcomeScreen.routeName,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case WelcomeScreen.routeName:
                return MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                );
              case HomeScreen.routeName:
                return MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                );
              case RecipeDetailsScreen.routeName:
                final args = settings.arguments as RecipeDetailsModel;
                return MaterialPageRoute(
                  builder: (context) => RecipeDetailsScreen(
                    recipeDetails: args,
                    // title: args.title,
                    // body: args.body,
                    // isBookmark: args.isBookmark,
                  ),
                );
              case FavoriteRecipesScreen.routeName:
                return MaterialPageRoute(
                    builder: (context) => const FavoriteRecipesScreen());
            }
          },
          home: const HomeScreen());
    });

  }
}
