import 'package:flutter/material.dart';
import 'package:lets_cooking/components/favorite_button.dart';
import 'package:lets_cooking/extensions/string_low_up.dart';
import 'package:lets_cooking/models/recipe_details_model.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../states/theme_state.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({Key? key, required this.recipeDetails})
      : super(key: key);
  final RecipeDetailsModel recipeDetails;
  static const routeName = '/RecipeDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final stateTheme = context.watch<ThemeState>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                recipeDetails.title!,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 24.0),
            Column(
              children: [
                Stack(children: [
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(recipeDetails.image!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 50.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: FavoriteButton(
                            recipeDetails: recipeDetails,
                            isFavorite: recipeDetails.isFavorite,
                            bgColor: AppColors.white)),
                  )
                ]),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 20.0,
                          color: AppColors.rating100,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          recipeDetails.healthScore! / 10 >= 0 &&
                                  recipeDetails.healthScore! / 10 <= 5
                              ? (recipeDetails.healthScore! / 10 + 0.5)
                                  .toString()
                              : '4.5',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: stateTheme.isDark
                                      ? AppColors.white
                                      : AppColors.neutral90),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '(${recipeDetails.aggregateLikes} Reviews)',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Text(
                      'Servings: ${recipeDetails.servings}',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: stateTheme.isDark
                              ? AppColors.white
                              : AppColors.neutral90),
                    ),
                    Text(
                      'Ready: ${recipeDetails.readyInMinutes} min',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: stateTheme.isDark
                              ? AppColors.white
                              : AppColors.neutral90),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            image: DecorationImage(
                              invertColors: true,
                              alignment: Alignment.topLeft,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                recipeDetails.image!,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.0,
                              child: Text(
                                recipeDetails.creditsText != null
                                    ? recipeDetails.creditsText!
                                        .split(' ')
                                        .first
                                    : 'Amore Mio',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: stateTheme.isDark
                                            ? AppColors.neutral10
                                            : AppColors.neutral100),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.place,
                                  color: AppColors.primary50,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                SizedBox(
                                  width: 200.0,
                                  child: Text(
                                    '${recipeDetails.extendedIngredients![recipeDetails.extendedIngredients!.length ~/ 2].aisle!.split(' ').last.lowUp().replaceAll(RegExp(r'[^\w\s]+'), '')}, ${recipeDetails.extendedIngredients![recipeDetails.extendedIngredients!.length ~/ 3].aisle!.split(' ').first.replaceAll(RegExp(r'[^\w\s]+'), '')}',
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                    softWrap: true,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '${recipeDetails.extendedIngredients!.length.toString()} items',
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
            const SizedBox(height: 16.0),
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: recipeDetails.extendedIngredients!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        height: 76.0,
                        decoration: BoxDecoration(
                            color: stateTheme.isDark
                                ? AppColors.neutral70
                                : AppColors.neutral10,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 12.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(4.0),
                                      width: 52.0,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Image.network(
                                        'https://spoonacular.com/cdn/ingredients_100x100/${recipeDetails.extendedIngredients![index].image}',
                                        errorBuilder:
                                            (context, exception, stacktrace) {
                                          return Image.asset(
                                            'assets/images/no_image_placeholder.png',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            recipeDetails
                                                    .extendedIngredients![index]
                                                    .aisle ??
                                                'Other',
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: true,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: stateTheme.isDark
                                                        ? AppColors.neutral90
                                                        : AppColors.neutral60),
                                          ),
                                          Text(
                                            recipeDetails
                                                .extendedIngredients![index]
                                                .name!
                                                .lowUp(),
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: true,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Text(
                                  '${recipeDetails.extendedIngredients![index].measures!.metric!.amount!.round().toString()} ${recipeDetails.extendedIngredients![index].measures!.metric!.unitShort}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: stateTheme.isDark
                                              ? AppColors.neutral90
                                              : AppColors.neutral60)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
