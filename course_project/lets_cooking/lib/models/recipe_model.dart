// class RecipeModel {
//   final int? id;
//   final String? title;
//   final String? image;
//   final String? imageType;
//   final int? servings;
//   final int? readyInMinutes;
//   final String? license;
//   final String? sourceName;
//   final String? sourceUrl;
//   final String? spoonacularSourceUrl;
//   final int? aggregateLikes;
//   final int? healthScore;
//   final int? spoonacularScore;
//   final double? pricePerServing;
//   final List<dynamic>? analyzedInstructions;
//   final bool? cheap;
//   final String? creditsText;
//   final List<dynamic>? cuisines;
//   final bool? dairyFree;
//   final List<dynamic>? diets;
//   final String? gaps;
//   final bool? glutenFree;
//   final String? instructions;
//   final bool? ketogenic;
//   final bool? lowFodmap;
//   final List<dynamic>? occasions;
//   final bool? sustainable;
//   final bool? vegan;
//   final bool? vegetarian;
//   final bool? veryHealthy;
//   final bool? veryPopular;
//   final bool? whole30;
//   final int? weightWatcherSmartPoints;
//   final List<String>? dishTypes;
//   final List<ExtendedIngredients>? extendedIngredients;
//   final String? summary;
//   final WinePairing? winePairing;
//
//   RecipeModel({
//     this.id,
//     this.title,
//     this.image,
//     this.imageType,
//     this.servings,
//     this.readyInMinutes,
//     this.license,
//     this.sourceName,
//     this.sourceUrl,
//     this.spoonacularSourceUrl,
//     this.aggregateLikes,
//     this.healthScore,
//     this.spoonacularScore,
//     this.pricePerServing,
//     this.analyzedInstructions,
//     this.cheap,
//     this.creditsText,
//     this.cuisines,
//     this.dairyFree,
//     this.diets,
//     this.gaps,
//     this.glutenFree,
//     this.instructions,
//     this.ketogenic,
//     this.lowFodmap,
//     this.occasions,
//     this.sustainable,
//     this.vegan,
//     this.vegetarian,
//     this.veryHealthy,
//     this.veryPopular,
//     this.whole30,
//     this.weightWatcherSmartPoints,
//     this.dishTypes,
//     this.extendedIngredients,
//     this.summary,
//     this.winePairing,
//   });
//
//   RecipeModel.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         title = json['title'] as String?,
//         image = json['image'] as String?,
//         imageType = json['imageType'] as String?,
//         servings = json['servings'] as int?,
//         readyInMinutes = json['readyInMinutes'] as int?,
//         license = json['license'] as String?,
//         sourceName = json['sourceName'] as String?,
//         sourceUrl = json['sourceUrl'] as String?,
//         spoonacularSourceUrl = json['spoonacularSourceUrl'] as String?,
//         aggregateLikes = json['aggregateLikes'] as int?,
//         healthScore = json['healthScore'] as int?,
//         spoonacularScore = json['spoonacularScore'] as int?,
//         pricePerServing = json['pricePerServing'] as double?,
//         analyzedInstructions = json['analyzedInstructions'] as List?,
//         cheap = json['cheap'] as bool?,
//         creditsText = json['creditsText'] as String?,
//         cuisines = json['cuisines'] as List?,
//         dairyFree = json['dairyFree'] as bool?,
//         diets = json['diets'] as List?,
//         gaps = json['gaps'] as String?,
//         glutenFree = json['glutenFree'] as bool?,
//         instructions = json['instructions'] as String?,
//         ketogenic = json['ketogenic'] as bool?,
//         lowFodmap = json['lowFodmap'] as bool?,
//         occasions = json['occasions'] as List?,
//         sustainable = json['sustainable'] as bool?,
//         vegan = json['vegan'] as bool?,
//         vegetarian = json['vegetarian'] as bool?,
//         veryHealthy = json['veryHealthy'] as bool?,
//         veryPopular = json['veryPopular'] as bool?,
//         whole30 = json['whole30'] as bool?,
//         weightWatcherSmartPoints = json['weightWatcherSmartPoints'] as int?,
//         dishTypes = (json['dishTypes'] as List?)?.map((dynamic e) => e as String).toList(),
//         extendedIngredients = (json['extendedIngredients'] as List?)?.map((dynamic e) => ExtendedIngredients.fromJson(e as Map<String,dynamic>)).toList(),
//         summary = json['summary'] as String?,
//         winePairing = (json['winePairing'] as Map<String,dynamic>?) != null ? WinePairing.fromJson(json['winePairing'] as Map<String,dynamic>) : null;
//
//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'title' : title,
//     'image' : image,
//     'imageType' : imageType,
//     'servings' : servings,
//     'readyInMinutes' : readyInMinutes,
//     'license' : license,
//     'sourceName' : sourceName,
//     'sourceUrl' : sourceUrl,
//     'spoonacularSourceUrl' : spoonacularSourceUrl,
//     'aggregateLikes' : aggregateLikes,
//     'healthScore' : healthScore,
//     'spoonacularScore' : spoonacularScore,
//     'pricePerServing' : pricePerServing,
//     'analyzedInstructions' : analyzedInstructions,
//     'cheap' : cheap,
//     'creditsText' : creditsText,
//     'cuisines' : cuisines,
//     'dairyFree' : dairyFree,
//     'diets' : diets,
//     'gaps' : gaps,
//     'glutenFree' : glutenFree,
//     'instructions' : instructions,
//     'ketogenic' : ketogenic,
//     'lowFodmap' : lowFodmap,
//     'occasions' : occasions,
//     'sustainable' : sustainable,
//     'vegan' : vegan,
//     'vegetarian' : vegetarian,
//     'veryHealthy' : veryHealthy,
//     'veryPopular' : veryPopular,
//     'whole30' : whole30,
//     'weightWatcherSmartPoints' : weightWatcherSmartPoints,
//     'dishTypes' : dishTypes,
//     'extendedIngredients' : extendedIngredients?.map((e) => e.toJson()).toList(),
//     'summary' : summary,
//     'winePairing' : winePairing?.toJson()
//   };
// }
//
// class ExtendedIngredients {
//   final String? aisle;
//   final int? amount;
//   final String? consitency;
//   final int? id;
//   final String? image;
//   final Measures? measures;
//   final List<dynamic>? meta;
//   final String? name;
//   final String? original;
//   final String? originalName;
//   final String? unit;
//
//   ExtendedIngredients({
//     this.aisle,
//     this.amount,
//     this.consitency,
//     this.id,
//     this.image,
//     this.measures,
//     this.meta,
//     this.name,
//     this.original,
//     this.originalName,
//     this.unit,
//   });
//
//   ExtendedIngredients.fromJson(Map<String, dynamic> json)
//       : aisle = json['aisle'] as String?,
//         amount = json['amount'] as int?,
//         consitency = json['consitency'] as String?,
//         id = json['id'] as int?,
//         image = json['image'] as String?,
//         measures = (json['measures'] as Map<String,dynamic>?) != null ? Measures.fromJson(json['measures'] as Map<String,dynamic>) : null,
//         meta = json['meta'] as List?,
//         name = json['name'] as String?,
//         original = json['original'] as String?,
//         originalName = json['originalName'] as String?,
//         unit = json['unit'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'aisle' : aisle,
//     'amount' : amount,
//     'consitency' : consitency,
//     'id' : id,
//     'image' : image,
//     'measures' : measures?.toJson(),
//     'meta' : meta,
//     'name' : name,
//     'original' : original,
//     'originalName' : originalName,
//     'unit' : unit
//   };
// }
//
// class Measures {
//   final Metric? metric;
//   final Us? us;
//
//   Measures({
//     this.metric,
//     this.us,
//   });
//
//   Measures.fromJson(Map<String, dynamic> json)
//       : metric = (json['metric'] as Map<String,dynamic>?) != null ? Metric.fromJson(json['metric'] as Map<String,dynamic>) : null,
//         us = (json['us'] as Map<String,dynamic>?) != null ? Us.fromJson(json['us'] as Map<String,dynamic>) : null;
//
//   Map<String, dynamic> toJson() => {
//     'metric' : metric?.toJson(),
//     'us' : us?.toJson()
//   };
// }
//
// class Metric {
//   final int? amount;
//   final String? unitLong;
//   final String? unitShort;
//
//   Metric({
//     this.amount,
//     this.unitLong,
//     this.unitShort,
//   });
//
//   Metric.fromJson(Map<String, dynamic> json)
//       : amount = json['amount'] as int?,
//         unitLong = json['unitLong'] as String?,
//         unitShort = json['unitShort'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'amount' : amount,
//     'unitLong' : unitLong,
//     'unitShort' : unitShort
//   };
// }
//
// class Us {
//   final int? amount;
//   final String? unitLong;
//   final String? unitShort;
//
//   Us({
//     this.amount,
//     this.unitLong,
//     this.unitShort,
//   });
//
//   Us.fromJson(Map<String, dynamic> json)
//       : amount = json['amount'] as int?,
//         unitLong = json['unitLong'] as String?,
//         unitShort = json['unitShort'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'amount' : amount,
//     'unitLong' : unitLong,
//     'unitShort' : unitShort
//   };
// }
//
// class WinePairing {
//   final List<String>? pairedWines;
//   final String? pairingText;
//   final List<ProductMatches>? productMatches;
//
//   WinePairing({
//     this.pairedWines,
//     this.pairingText,
//     this.productMatches,
//   });
//
//   WinePairing.fromJson(Map<String, dynamic> json)
//       : pairedWines = (json['pairedWines'] as List?)?.map((dynamic e) => e as String).toList(),
//         pairingText = json['pairingText'] as String?,
//         productMatches = (json['productMatches'] as List?)?.map((dynamic e) => ProductMatches.fromJson(e as Map<String,dynamic>)).toList();
//
//   Map<String, dynamic> toJson() => {
//     'pairedWines' : pairedWines,
//     'pairingText' : pairingText,
//     'productMatches' : productMatches?.map((e) => e.toJson()).toList()
//   };
// }
//
// class ProductMatches {
//   final int? id;
//   final String? title;
//   final String? description;
//   final String? price;
//   final String? imageUrl;
//   final double? averageRating;
//   final int? ratingCount;
//   final double? score;
//   final String? link;
//
//   ProductMatches({
//     this.id,
//     this.title,
//     this.description,
//     this.price,
//     this.imageUrl,
//     this.averageRating,
//     this.ratingCount,
//     this.score,
//     this.link,
//   });
//
//   ProductMatches.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         title = json['title'] as String?,
//         description = json['description'] as String?,
//         price = json['price'] as String?,
//         imageUrl = json['imageUrl'] as String?,
//         averageRating = json['averageRating'] as double?,
//         ratingCount = json['ratingCount'] as int?,
//         score = json['score'] as double?,
//         link = json['link'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'title' : title,
//     'description' : description,
//     'price' : price,
//     'imageUrl' : imageUrl,
//     'averageRating' : averageRating,
//     'ratingCount' : ratingCount,
//     'score' : score,
//     'link' : link
//   };
// }
//
//

class RecipeModel {
  final bool? vegetarian;
  final bool? vegan;
  final bool? glutenFree;
  final bool? dairyFree;
  final bool? veryHealthy;
  final bool? cheap;
  final bool? veryPopular;
  final bool? sustainable;
  final bool? lowFodmap;
  final int? weightWatcherSmartPoints;
  final String? gaps;
  final int? preparationMinutes;
  final int? cookingMinutes;
  final int? aggregateLikes;
  final int? healthScore;
  final String? creditsText;
  final String? license;
  final String? sourceName;
  final double? pricePerServing;
  final List<ExtendedIngredients>? extendedIngredients;
  final int? id;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;
  final int? openLicense;
  final String? image;
  final String? imageType;
  final String? summary;
  final List<dynamic>? cuisines;
  final List<String>? dishTypes;
  final List<dynamic>? diets;
  final List<dynamic>? occasions;
  final WinePairing? winePairing;
  final String? instructions;
  final List<dynamic>? analyzedInstructions;
  final dynamic originalId;
  final String? spoonacularSourceUrl;

  RecipeModel({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.openLicense,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.winePairing,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularSourceUrl,
  });

  RecipeModel.fromJson(Map<String, dynamic> json)
      : vegetarian = json['vegetarian'] as bool?,
        vegan = json['vegan'] as bool?,
        glutenFree = json['glutenFree'] as bool?,
        dairyFree = json['dairyFree'] as bool?,
        veryHealthy = json['veryHealthy'] as bool?,
        cheap = json['cheap'] as bool?,
        veryPopular = json['veryPopular'] as bool?,
        sustainable = json['sustainable'] as bool?,
        lowFodmap = json['lowFodmap'] as bool?,
        weightWatcherSmartPoints = json['weightWatcherSmartPoints'] as int?,
        gaps = json['gaps'] as String?,
        preparationMinutes = json['preparationMinutes'] as int?,
        cookingMinutes = json['cookingMinutes'] as int?,
        aggregateLikes = json['aggregateLikes'] as int?,
        healthScore = json['healthScore'] as int?,
        creditsText = json['creditsText'] as String?,
        license = json['license'] as String?,
        sourceName = json['sourceName'] as String?,
        pricePerServing = json['pricePerServing'] as double?,
        extendedIngredients = (json['extendedIngredients'] as List?)?.map((dynamic e) => ExtendedIngredients.fromJson(e as Map<String,dynamic>)).toList(),
        id = json['id'] as int?,
        title = json['title'] as String?,
        readyInMinutes = json['readyInMinutes'] as int?,
        servings = json['servings'] as int?,
        sourceUrl = json['sourceUrl'] as String?,
        openLicense = json['openLicense'] as int?,
        image = json['image'] as String?,
        imageType = json['imageType'] as String?,
        summary = json['summary'] as String?,
        cuisines = json['cuisines'] as List?,
        dishTypes = (json['dishTypes'] as List?)?.map((dynamic e) => e as String).toList(),
        diets = json['diets'] as List?,
        occasions = json['occasions'] as List?,
        winePairing = (json['winePairing'] as Map<String,dynamic>?) != null ? WinePairing.fromJson(json['winePairing'] as Map<String,dynamic>) : null,
        instructions = json['instructions'] as String?,
        analyzedInstructions = json['analyzedInstructions'] as List?,
        originalId = json['originalId'],
        spoonacularSourceUrl = json['spoonacularSourceUrl'] as String?;

  Map<String, dynamic> toJson() => {
    'vegetarian' : vegetarian,
    'vegan' : vegan,
    'glutenFree' : glutenFree,
    'dairyFree' : dairyFree,
    'veryHealthy' : veryHealthy,
    'cheap' : cheap,
    'veryPopular' : veryPopular,
    'sustainable' : sustainable,
    'lowFodmap' : lowFodmap,
    'weightWatcherSmartPoints' : weightWatcherSmartPoints,
    'gaps' : gaps,
    'preparationMinutes' : preparationMinutes,
    'cookingMinutes' : cookingMinutes,
    'aggregateLikes' : aggregateLikes,
    'healthScore' : healthScore,
    'creditsText' : creditsText,
    'license' : license,
    'sourceName' : sourceName,
    'pricePerServing' : pricePerServing,
    'extendedIngredients' : extendedIngredients?.map((e) => e.toJson()).toList(),
    'id' : id,
    'title' : title,
    'readyInMinutes' : readyInMinutes,
    'servings' : servings,
    'sourceUrl' : sourceUrl,
    'openLicense' : openLicense,
    'image' : image,
    'imageType' : imageType,
    'summary' : summary,
    'cuisines' : cuisines,
    'dishTypes' : dishTypes,
    'diets' : diets,
    'occasions' : occasions,
    'winePairing' : winePairing?.toJson(),
    'instructions' : instructions,
    'analyzedInstructions' : analyzedInstructions,
    'originalId' : originalId,
    'spoonacularSourceUrl' : spoonacularSourceUrl
  };
}

class ExtendedIngredients {
  final int? id;
  final String? aisle;
  final String? image;
  final String? consistency;
  final String? name;
  final String? nameClean;
  final String? original;
  final String? originalName;
  final double? amount;
  final String? unit;
  final List<dynamic>? meta;
  final Measures? measures;

  ExtendedIngredients({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  ExtendedIngredients.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        aisle = json['aisle'] as String?,
        image = json['image'] as String?,
        consistency = json['consistency'] as String?,
        name = json['name'] as String?,
        nameClean = json['nameClean'] as String?,
        original = json['original'] as String?,
        originalName = json['originalName'] as String?,
        amount = json['amount'] as double?,
        unit = json['unit'] as String?,
        meta = json['meta'] as List?,
        measures = (json['measures'] as Map<String,dynamic>?) != null ? Measures.fromJson(json['measures'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'aisle' : aisle,
    'image' : image,
    'consistency' : consistency,
    'name' : name,
    'nameClean' : nameClean,
    'original' : original,
    'originalName' : originalName,
    'amount' : amount,
    'unit' : unit,
    'meta' : meta,
    'measures' : measures?.toJson()
  };
}

class Measures {
  final Us? us;
  final Metric? metric;

  Measures({
    this.us,
    this.metric,
  });

  Measures.fromJson(Map<String, dynamic> json)
      : us = (json['us'] as Map<String,dynamic>?) != null ? Us.fromJson(json['us'] as Map<String,dynamic>) : null,
        metric = (json['metric'] as Map<String,dynamic>?) != null ? Metric.fromJson(json['metric'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'us' : us?.toJson(),
    'metric' : metric?.toJson()
  };
}

class Us {
  final double? amount;
  final String? unitShort;
  final String? unitLong;

  Us({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  Us.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as double?,
        unitShort = json['unitShort'] as String?,
        unitLong = json['unitLong'] as String?;

  Map<String, dynamic> toJson() => {
    'amount' : amount,
    'unitShort' : unitShort,
    'unitLong' : unitLong
  };
}

class Metric {
  final double? amount;
  final String? unitShort;
  final String? unitLong;

  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  Metric.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as double?,
        unitShort = json['unitShort'] as String?,
        unitLong = json['unitLong'] as String?;

  Map<String, dynamic> toJson() => {
    'amount' : amount,
    'unitShort' : unitShort,
    'unitLong' : unitLong
  };
}

class WinePairing {
  final List<dynamic>? pairedWines;
  final String? pairingText;
  final List<dynamic>? productMatches;

  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });

  WinePairing.fromJson(Map<String, dynamic> json)
      : pairedWines = json['pairedWines'] as List?,
        pairingText = json['pairingText'] as String?,
        productMatches = json['productMatches'] as List?;

  Map<String, dynamic> toJson() => {
    'pairedWines' : pairedWines,
    'pairingText' : pairingText,
    'productMatches' : productMatches
  };
}