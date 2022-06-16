import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lets_cooking/screens/favorite_recipe_screen.dart';
import 'package:lets_cooking/screens/home_screen.dart';
import 'package:lets_cooking/screens/recipe_details_screen.dart';
import 'package:lets_cooking/themes/dark_theme.dart';
import 'package:lets_cooking/themes/light_theme.dart';
import 'package:lets_cooking/states/theme_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/hive_boxes_names.dart';
import 'models/recipe_details_model.dart';
import 'screens/welcome_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeDetailsModelAdapter());
  Hive.registerAdapter(ExtendedIngredientsAdapter());
  Hive.registerAdapter(MeasuresAdapter());
  Hive.registerAdapter(MetricAdapter());
  await Hive.openBox<RecipeDetailsModel>(HiveBoxesNames.favoriteRecipes);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeState(storage)),
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
                final args = settings.arguments as Map;
                return MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    trendRecipes: args['trendRecipes'],
                    popularRecipes: args['popularRecipes'],
                  ),
                );
              case RecipeDetailsScreen.routeName:
                final args = settings.arguments as RecipeDetailsModel;
                return MaterialPageRoute(
                  builder: (context) => RecipeDetailsScreen(
                    recipeDetails: args,
                  ),
                );
              case FavoriteRecipesScreen.routeName:
                return MaterialPageRoute(
                    builder: (context) => const FavoriteRecipesScreen());
            }
          },
      );
    });

  }
}
