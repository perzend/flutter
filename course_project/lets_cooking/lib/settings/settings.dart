abstract class Settings {
  // API Parameters
  // Meal types
  // static const List<String> mealTypes = [
  //   'main course',
  //   'side dish',
  //   'dessert',
  //   'appetizer',
  //   'salad',
  //   'bread',
  //   'breakfast',
  //   'soup',
  //   'beverage',
  //   'sauce',
  //   'marinade',
  //   'fingerfood',
  //   'snack',
  //   'drink'
  // ];
  //
  // static const Map<String, String> mealTypes = {
  //   'Main Course': 'main course',
  //   'Side Dish': 'side dish',
  //   'Dessert': 'dessert',
  //   'Appetizer': 'appetizer',
  //   'Salad': 'salad',
  //   'Bread': 'bread',
  //   'Breakfast': 'breakfast',
  //   'Soup': 'soup',
  //   'Beverage': 'beverage',
  //   'Sauce': 'sauce',
  //   'Marinade': 'marinade',
  //   'Fingerfood': 'fingerfood',
  //   'Snack': 'snack',
  //   'Drink': 'drink'
  // };
  //
  // static const Map<String, String> dietTypes = {
  //   'Gluten Free': 'gluten free',
  //   'Ketogenic': 'ketogenic',
  //   'Vegetarian': 'vegetarian',
  //   'Lacto-Vegetarian': 'lacto vegetarian',
  //   'Ovo-Vegetarian': 'ovo vegetarian',
  //   'Vegan': 'vegan',
  //   'Pescetarian': 'pescetarian',
  //   'Paleo': 'paleo',
  //   'Primal': 'primal',
  //   'Low FODMAP': 'low fodmap',
  //   'Whole30': 'whole30',
  // };
  //
  // static const Map<String, String> cuisineTypes = {
  //   'African': 'african',
  //   'American': 'american',
  //   'British': 'british',
  //   'Cajun': 'cajun',
  //   'Caribbean': 'caribbean',
  //   'Chinese': 'chinese',
  //   'Eastern European': 'eastern european',
  //   'European': 'european',
  //   'French': 'french',
  //   'German': 'german',
  //   'Greek': 'greek',
  //   'Indian': 'indian',
  //   'Irish': 'irish',
  //   'Italian': 'italian',
  //   'Japanese': 'japanese',
  //   'Jewish': 'jewish',
  //   'Korean': 'korean',
  //   'Latin American': 'latin american',
  //   'Mediterranean': 'mediterranean',
  //   'Mexican': 'mexican',
  //   'Middle Eastern': 'middle eastern',
  //   'Nordic': 'nordic',
  //   'Southern': 'southern',
  //   'Spanish': 'spanish',
  //   'Thai': 'thai',
  //   'Vietnamese': 'vietnamese'
  // };
  //
  // static const Map<String, String> intolerancesTypes = {
  //   'Dairy': 'dairy',
  //   'Egg': 'egg',
  //   'Gluten': 'gluten',
  //   'Grain': 'grain',
  //   'Peanut': 'peanut',
  //   'Seafood': 'seafood',
  //   'Sesame': 'sesame',
  //   'Shellfish': 'shellfish',
  //   'Soy': 'soy',
  //   'Sulfite': 'sulfite',
  //   'Tree Nut': 'tree nut',
  //   'Wheat': 'wheat'
  // };

  // Количество возвращаемых популярных рецептов
  static const int numberRecipesInPopularCategory = 10;

  // Категории популярных рецептов.
  // Если список будет пуст - категории не отобразятся
  // Лучше указывать от 3 до 7 категорий одного типа.
  static const List<String> popularCategories = [
    'salad',
    'breakfast',
    'appetizer',
    'snack',
    'dessert',
    'main course'
  ];

  // Количество возвращаемых рецептов для тренда
  static const int numberTrendRecipes = 20;

  // Категории рецептов для тренда.
  // Если не указать при запросе - придут разные рецепты из разных категорий
  // Если указать при запросе - придут разные рецепты из указанных категорий
  // Указывать можно максимум две категории разных типов, например 'vegan, dessert'
  static const String trendCategories = 'mediterranean';
}
