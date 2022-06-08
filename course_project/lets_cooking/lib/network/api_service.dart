import 'package:dio/dio.dart';

import '../models/api_model.dart';
import '../models/recipe_model.dart';

const _apiKeyUrl = '?apiKey=78c0b0dde49e4b11a9596d4836f9aaa6';
const _baseUrl = 'https://api.spoonacular.com/recipes/';
const _infoRecipeUrl = '/information';

abstract class ApiService {
  //Future<ApiModel<List<RecipeModel>, Failure>> getRecipes();
 //Future<ApiModel<List<RecipeModel>, Failure>> getRecipe({required int recipeId});
 Future<ApiModel<RecipeModel, Failure>> getRecipe({required int recipeId});
}

 class ApiServiceDio implements ApiService {
  static final ApiServiceDio _instance = ApiServiceDio._();

  ApiServiceDio._();

  static ApiServiceDio get instance => _instance;

  final Dio dio = Dio()..options.baseUrl = _baseUrl;
//
//   @override
//   Future<ApiModel<List<RecipeModel>, Failure>> getRecipes() async {
//     try {
//       final response = await dio.get(_randomRecipeUrl+apiKeyUrl);
//
//
//       final list = response.data as List<dynamic>;
//
//       final models = list.map((e) => RecipeModel.fromJson(e));
//
//       return ApiModel.success(models.toList());
//     } catch (e) {
//       return ApiModel.error(Failure());
//     }
//   }

  @override
  Future<ApiModel<RecipeModel, Failure>> getRecipe({required int recipeId}) async {
   try {
      final response = await dio.get(recipeId.toString()+_infoRecipeUrl + _apiKeyUrl);
      final models = RecipeModel.fromJson(response.data as Map<String,dynamic>);
      return ApiModel.success(models);
    } catch (e) {
      return ApiModel.error(Failure());
    }
  }
}