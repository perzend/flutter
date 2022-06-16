import 'package:flutter/material.dart';
import 'package:lets_cooking/models/recipes_model.dart';
import 'package:marquee/marquee.dart';

import '../components/favorite_button.dart';
import '../constants/colors.dart';
import '../screens/recipe_details_screen.dart';

class TrendRecipes extends StatelessWidget {
  const TrendRecipes({Key? key, required this.trendRecipes}) : super(key: key);
  final RecipesModel trendRecipes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 274.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: trendRecipes.recipes?.length,
          itemBuilder: (context, index) {
            if (trendRecipes.recipes?[index].image == null) {
              return const SizedBox.shrink();
            }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Stack(alignment: Alignment.center, children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RecipeDetailsScreen.routeName,
                              arguments: trendRecipes.recipes![index]);
                        },
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 180.0,
                          width: 280.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                trendRecipes.recipes![index].image!,
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
                            color: AppColors.neutral90.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: 58.0,
                          height: 28.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.rating100,
                              ),
                              Text(
                                trendRecipes.recipes![index].healthScore! /
                                                10 >=
                                            0 &&
                                        trendRecipes.recipes![index]
                                                    .healthScore! /
                                                10 <=
                                            4.5
                                    ? (trendRecipes.recipes![index]
                                                    .healthScore! /
                                                10 +
                                            0.5)
                                        .toString()
                                    : '4.5',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: FavoriteButton(
                          recipeDetails: trendRecipes.recipes![index],
                          isFavorite: trendRecipes.recipes![index].isFavorite,
                          bgColor: AppColors.neutral10,
                        ),
                      ),
                      Positioned(
                        bottom: 8.0,
                        right: 8.0,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.neutral90.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: 80.0,
                          height: 28.0,
                          child: Text(
                            '${trendRecipes.recipes![index].readyInMinutes} min',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
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
                      text: '${trendRecipes.recipes![index].title!}   ||',
                      style: Theme.of(context).textTheme.bodyText1,
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
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            invertColors: true,
                            alignment: Alignment.topLeft,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              trendRecipes.recipes![index].image!,
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        trendRecipes.recipes![index].creditsText != null
                            ? 'By ${trendRecipes.recipes![index].creditsText!.replaceAll('.', ' ').split(' ').first} ${trendRecipes.recipes![index].creditsText!.replaceAll('.', ' ').split(' ').last}'
                            : 'By Amore Mio',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ])
                ]);
          }),
    );
  }
}
