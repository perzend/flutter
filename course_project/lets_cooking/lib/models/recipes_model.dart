import 'package:lets_cooking/models/recipe_details_model.dart';

class RecipesModel {
  final List<RecipeDetailsModel>? recipes;

  RecipesModel({
    this.recipes,
  });

  RecipesModel.fromJson(Map<String, dynamic> json)
      : recipes = (json['recipes'] as List?)
            ?.map((dynamic e) =>
                RecipeDetailsModel.fromJson(e as Map<String, dynamic>))
            .toList();
}
