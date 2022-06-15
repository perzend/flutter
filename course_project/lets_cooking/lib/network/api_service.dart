import 'package:dio/dio.dart';

import '../models/api_model.dart';
import '../models/recipe_details_model.dart';
import '../models/recipes_model.dart';
import '../settings/settings.dart';

const _apiKeys = <String>[
  '78c0b0dde49e4b11a9596d4836f9aaa6',
  'ea73fd3e56824ffeabb82402c6b163d8',
  '56a78bfc7eac493bafb9867cc3ca5310'
];

const _baseUrl = 'https://api.spoonacular.com/recipes/';
const _infoRecipeUrl = '/information';

double xAPIQuotaTotalUsed = 0;

abstract class ApiService {
  Future<ApiModel<RecipesModel, Failure>> getRandomRecipes(int numberRecipes,
      [String? tags]);

  Future<ApiModel<RecipeDetailsModel, Failure>> getRecipeById(
      {required int recipeId});
}

class ApiServiceDio implements ApiService {
  static final ApiServiceDio _instance = ApiServiceDio._();

  ApiServiceDio._();

  static ApiServiceDio get instance => _instance;

  final Dio dio = Dio()..options.baseUrl = _baseUrl;

  @override
  Future<ApiModel<RecipesModel, Failure>> getRandomRecipes(int numberRecipes,
      [String? tags]) async {
    final String url = tags != null && tags.isNotEmpty
        ? 'random?number=$numberRecipes&tags=$tags'
        : 'random?number=$numberRecipes';

    final String apiKey = _apiKeys[2];
    // if (xAPIQuotaTotalUsed < 145) {
    //   apiKey = _apiKeys[0];
    // } else {
    //   xAPIQuotaTotalUsed = 0;
    //   apiKey = _apiKeys[1];
    // }
    dio.options.headers['x-api-key'] = apiKey;

    // try {
    final response = await dio.get(url);
    print(response.headers['x-api-quota-request']);
    xAPIQuotaTotalUsed = xAPIQuotaTotalUsed +
        double.tryParse(response.headers['x-api-quota-request']!.first)!;
    // print(xAPIQuotaUsed);

    final models = RecipesModel.fromJson(response.data as Map<String, dynamic>);
    return ApiModel.success(models);
    //  } catch (e) {
    //   return ApiModel.error(Failure());
    //  }
  }

  @override
  Future<ApiModel<RecipeDetailsModel, Failure>> getRecipeById(
      {required int recipeId}) async {
    try {
      final response = await dio.get('$recipeId$_infoRecipeUrl?${_apiKeys[0]}');
      final models =
          RecipeDetailsModel.fromJson(response.data as Map<String, dynamic>);
      return ApiModel.success(models);
    } catch (e) {
      return ApiModel.error(Failure());
    }
  }
}
