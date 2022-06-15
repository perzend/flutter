
import 'package:hive/hive.dart';

part 'recipe_details_model.g.dart';

@HiveType(typeId: 0)
class RecipeDetailsModel extends HiveObject{
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final int? readyInMinutes;
  @HiveField(3)
  final int? servings;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final int? aggregateLikes;
  @HiveField(6)
  final int? healthScore;
  @HiveField(7)
  final String? creditsText;
  @HiveField(8)
  final List<ExtendedIngredients>? extendedIngredients;
  @HiveField(9)
  bool isFavorite = false;


  RecipeDetailsModel({
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.image,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.extendedIngredients,
  });

  RecipeDetailsModel.fromJson(Map<String, dynamic> json)
      : aggregateLikes = json['aggregateLikes'] as int?,
        healthScore = json['healthScore'] as int?,
        creditsText = json['creditsText'] as String?,
        extendedIngredients = (json['extendedIngredients'] as List?)
            ?.map((dynamic e) =>
                ExtendedIngredients.fromJson(e as Map<String, dynamic>))
            .toList(),
        id = json['id'] as int?,
        title = json['title'] as String?,
        readyInMinutes = json['readyInMinutes'] as int?,
        servings = json['servings'] as int?,
        image = json['image'] as String?;
}
@HiveType(typeId: 1)
class ExtendedIngredients {
  @HiveField(0)
  final String? aisle;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final Measures? measures;

  ExtendedIngredients({
    this.aisle,
    this.image,
    this.name,
    this.measures,
  });

  ExtendedIngredients.fromJson(Map<String, dynamic> json)
      : aisle = json['aisle'] as String?,
        image = json['image'] as String?,
        name = json['name'] as String?,
        measures = (json['measures'] as Map<String, dynamic>?) != null
            ? Measures.fromJson(json['measures'] as Map<String, dynamic>)
            : null;
}
@HiveType(typeId: 2)
class Measures {
  @HiveField(0)
  final Metric? metric;

  Measures({
    this.metric,
  });

  Measures.fromJson(Map<String, dynamic> json)
      : metric = (json['metric'] as Map<String, dynamic>?) != null
            ? Metric.fromJson(json['metric'] as Map<String, dynamic>)
            : null;
}
@HiveType(typeId: 3)
class Metric {
  @HiveField(0)
  final double? amount;
  @HiveField(1)
  final String? unitShort;

  Metric({
    this.amount,
    this.unitShort,
  });

  Metric.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as double?,
        unitShort = json['unitShort'] as String?;
}
