import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lets_cooking/components/favorite_button.dart';
import 'package:lets_cooking/extensions/string_low_up.dart';
import 'package:lets_cooking/main.dart';
import 'package:lets_cooking/screens/favorite_recipe_screen.dart';
import 'package:lets_cooking/theme/theme_state.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';
import '../content_state.dart';
import '../models/recipe_details_model.dart';
import '../models/recipes_model.dart';
import '../network/api_service.dart';
import '../settings/settings.dart';
import '../widgets/popular_category.dart';
import 'recipe_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;

  late RecipesModel trendRecipes;
  var popularRecipes = <String, RecipesModel>{};

  Future<void> loadTrendRecipes() async {
    setState(() {
      state = ContentState.loading;
    });
    final response =
        await service.getRandomRecipes(Settings.numberTrendRecipes);
    if (response.hasError) {
      setState(() {
        state = ContentState.failure;
      });
    } else {
      setState(() {
        state =
            response.result != null ? ContentState.success : ContentState.empty;
        trendRecipes = response.result!;
      });
    }
  }

  Future<Map<String, RecipesModel>> loadPopularRecipes() async {
    for (var category in Settings.popularCategories) {
      final response = await service.getRandomRecipes(
          Settings.numberRecipesInPopularCategory, category);
      popularRecipes[category] = response.result!;
    }
    return popularRecipes;
  }

  Future<RecipeDetailsModel?> loadRecipeById(int id) async {
    final response = await service.getRecipeById(recipeId: id);

    return response.result;
  }

  @override
  void initState() {
    super.initState();
    loadTrendRecipes();
    loadPopularRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final stateTheme = context.watch<ThemeState>();
    switch (state) {
      case ContentState.success:
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Find best recipe for cooking',
              style: Theme.of(context).textTheme.headline4,
            ),
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      style: Theme.of(context).textTheme.headline5,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search recipes',
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: AppColors.neutral20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text('Trending now 🔥',
                        style: Theme.of(context).textTheme.headline5),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 274.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: trendRecipes.recipes!.length,
                          itemBuilder: (context, index) {
                            if (trendRecipes.recipes![index].image == null) {
                              return const SizedBox.shrink();
                            }
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  RecipeDetailsScreen.routeName,
                                                  arguments: trendRecipes
                                                      .recipes![index]);
                                            },
                                            child: Container(
                                              clipBehavior: Clip.hardEdge,
                                              height: 180.0,
                                              width: 280.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    trendRecipes
                                                        .recipes![index].image!,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 8.0,
                                            left: 8.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.neutral90
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              width: 58.0,
                                              height: 28.0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: AppColors.white,
                                                  ),
                                                  Text(
                                                    trendRecipes.recipes![index]
                                                                        .healthScore! /
                                                                    10 >=
                                                                0 &&
                                                            trendRecipes
                                                                        .recipes![
                                                                            index]
                                                                        .healthScore! /
                                                                    10 <=
                                                                4.5
                                                        ? (trendRecipes
                                                                        .recipes![
                                                                            index]
                                                                        .healthScore! /
                                                                    10 +
                                                                0.5)
                                                            .toString()
                                                        : '4.5',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors
                                                                .white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 8.0,
                                            right: 8.0,
                                            child: FavoriteButton(
                                              recipeDetails:
                                                  trendRecipes.recipes![index],
                                              isFavorite: trendRecipes
                                                  .recipes![index].isFavorite,
                                              bgColor: AppColors.neutral10,
                                            ),

                                            // Container(
                                            //   height: 32.0,
                                            //   width: 32.0,
                                            //   alignment: Alignment.center,
                                            //   decoration: BoxDecoration(
                                            //     color: AppColors.neutral10,
                                            //     borderRadius: BorderRadius.circular(16.0),
                                            //   ),
                                            //   child: Center(
                                            //     child: IconButton(
                                            //         onPressed: () {},
                                            //         padding: EdgeInsets.zero,
                                            //         icon: const Icon(
                                            //           Icons.bookmark,
                                            //           size: 22.0,
                                            //           color: AppColors.neutral90,
                                            //         )),
                                            //   ),
                                            // ),
                                          ),
                                          Positioned(
                                            bottom: 8.0,
                                            right: 8.0,
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: AppColors.neutral90
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              width: 80.0,
                                              height: 28.0,
                                              child: Text(
                                                '${trendRecipes.recipes![index].readyInMinutes} min',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors.white),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  SizedBox(
                                    width: 260.0,
                                    height: 22.0,
                                    child: Marquee(
                                      text:
                                          '${trendRecipes.recipes![index].title!}   ||',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                      blankSpace: 10.0,
                                      velocity: 20.0,
                                      fadingEdgeStartFraction: 0.4,
                                      fadingEdgeEndFraction: 0.2,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(children: [
                                    Container(
                                      height: 32.0,
                                      width: 32.0,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          image: DecorationImage(
                                            invertColors: true,
                                            alignment: Alignment.topLeft,
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              trendRecipes
                                                  .recipes![index].image!,
                                            ),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      trendRecipes.recipes![index]
                                                  .creditsText !=
                                              null
                                          ? 'By ${trendRecipes.recipes![index].creditsText!.replaceAll('.', ' ').split(' ').first} ${trendRecipes.recipes![index].creditsText!.replaceAll('.', ' ').split(' ').last}'
                                          : 'By Amore Mio',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ])
                                ]);
                          }),
                    ),
                    Text('Popular category',
                        style: Theme.of(context).textTheme.headline5),
                    const SizedBox(
                      height: 16.0,
                    ),
                    // FutureBuilder<Map<String, RecipesModel>>(
                    //     future: loadPopularRecipes(),
                    //     builder: (context, snapshot) {
                    //       return snapshot.hasData
                    //           ?
                    PopularCategory(popularRecipes: popularRecipes),
                    // : Text('Error');
                    //}
                    //),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Favorite recipe',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          ValueListenableBuilder(
                              valueListenable: Hive.box<RecipeDetailsModel>(
                                      favoriteRecipesBox)
                                  .listenable(),
                              builder:
                                  (context, Box<RecipeDetailsModel> box, _) {
                                if (box.values.isEmpty) {
                                  return const SizedBox.shrink();
                                }
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        FavoriteRecipesScreen.routeName);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'See all',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary50),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.primary50,
                                      ),
                                    ],
                                  ),
                                );
                              })
                        ]),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ValueListenableBuilder(
                        valueListenable:
                            Hive.box<RecipeDetailsModel>(favoriteRecipesBox)
                                .listenable(),
                        builder: (context, Box<RecipeDetailsModel> box, _) {
                          if (box.values.isEmpty) {
                            return Text(
                              'No favorite recipes yet',
                              style: Theme.of(context).textTheme.bodyText2,
                            );
                          }
                          return SizedBox(
                            height: 200.0,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: box.values.length,
                                itemBuilder: (context, index) {
                                  RecipeDetailsModel? res = box.getAt(index);
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: SizedBox(
                                      width: 124.0,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 124.0,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Image.network(
                                              res!.image!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            res.title!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          //Text(res!),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        })
                  ]),
            ),
          ),
        );
      case ContentState.loading:
        return Scaffold(
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      case ContentState.empty:
        return Scaffold(
          body: const Center(
            child: Text('Пустой список постов'),
          ),
        );
      case ContentState.failure:
        return Scaffold(
          body: const Center(
            child: Text(
              'Ууупс, что-то пошло не так',
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      default:
        return Scaffold(
          body: const Center(
            child: Text('Данные не загружены'),
          ),
        );
    }
  }
}
