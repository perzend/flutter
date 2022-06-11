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
  final int aggregateLikes;
  final int healthScore;
  final String creditsText;
  final String? license;
  final String? sourceName;
  final double? pricePerServing;
  final List<ExtendedIngredients>? extendedIngredients;
  final int id;
  final String title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;
  final int? openLicense;
  final String image;
  final String? imageType;
  final String? summary;
  final List<dynamic>? cuisines;
  final List<String>? dishTypes;
  final List<dynamic>? diets;
  final List<dynamic>? occasions;
  final WinePairing winePairing;
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
    required this.aggregateLikes,
    required this.healthScore,
    required this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    required this.id,
    required  this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.openLicense,
    required this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    required this.winePairing,
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
        aggregateLikes = json['aggregateLikes'] as int,
        healthScore = json['healthScore'] as int,
        creditsText = json['creditsText'] as String,
        license = json['license'] as String?,
        sourceName = json['sourceName'] as String?,
        pricePerServing = json['pricePerServing'] as double?,
        extendedIngredients = (json['extendedIngredients'] as List?)?.map((dynamic e) => ExtendedIngredients.fromJson(e as Map<String,dynamic>)).toList(),
        id = json['id'] as int,
        title = json['title'] as String,
        readyInMinutes = json['readyInMinutes'] as int?,
        servings = json['servings'] as int?,
        sourceUrl = json['sourceUrl'] as String?,
        openLicense = json['openLicense'] as int?,
        image = json['image'] as String,
        imageType = json['imageType'] as String?,
        summary = json['summary'] as String?,
        cuisines = json['cuisines'] as List?,
        dishTypes = (json['dishTypes'] as List?)?.map((dynamic e) => e as String).toList(),
        diets = json['diets'] as List?,
        occasions = json['occasions'] as List?,
        winePairing = WinePairing.fromJson(json['winePairing'] as Map<String,dynamic>),
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
    'winePairing' : winePairing.toJson(),
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
  final String pairingText;
  final List<dynamic>? productMatches;

  WinePairing({
    this.pairedWines,
    required this.pairingText,
    this.productMatches,
  });

  WinePairing.fromJson(Map<String, dynamic> json)
      : pairedWines = json['pairedWines'] as List?,
        pairingText = json['pairingText'] as String,
        productMatches = json['productMatches'] as List?;

  Map<String, dynamic> toJson() => {
    'pairedWines' : pairedWines,
    'pairingText' : pairingText,
    'productMatches' : productMatches
  };
}