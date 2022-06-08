import 'package:flutter/material.dart';
import 'package:lets_cooking/extensions/string_low_up.dart';
import 'package:lets_cooking/models/recipe_model.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';
import '../content_state.dart';
import '../network/api_service.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({Key? key}) : super(key: key);

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;
  late RecipeModel recipe;

  Future<void> load(int recipeId) async {
    setState(() {
      state = ContentState.loading;
    });
    final response = await service.getRecipe(recipeId: recipeId);
    if (response.hasError) {
      setState(() {
        print(response.result);
        state = ContentState.failure;
      });
    } else {
      setState(() {
        state =
            response.result != null ? ContentState.success : ContentState.empty;
        recipe = response.result!;
        print(recipe);
      });
    }
  }

  @override
  void initState() {
    load(716429);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    recipe.title,
                    style: AppTextStyle.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral90),
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
                          child: Image.network(recipe.image),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, right: 50.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark,
                                size: 50.0,
                                color: AppColors.neutral30,
                              )),
                        ),
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
                              recipe.healthScore / 10 >= 0 &&
                                      recipe.healthScore / 10 <= 5
                                  ? (recipe.healthScore / 10).toString()
                                  : '4.5',
                              style: AppTextStyle.label.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.neutral90),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '(${recipe.aggregateLikes} Reviews)',
                              style: AppTextStyle.label
                                  .copyWith(color: AppColors.neutral40),
                            ),
                          ],
                        ),
                        Text(
                          'Servings: ${recipe.servings}',
                          style: AppTextStyle.label.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.neutral90),
                        ),
                        Text(
                          'Ready: ${recipe.readyInMinutes} min.',
                          style: AppTextStyle.label.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.neutral90),
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
                                      recipe.image,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.creditsText,
                                  style: AppTextStyle.paragraph.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.neutral100),
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
                                    Text(
                                      '${recipe.winePairing.pairingText.split(' ').last.lowUp().replaceAll('.', '')}, ${recipe.winePairing.pairingText.split(' ').first}',
                                      style: AppTextStyle.label
                                          .copyWith(color: AppColors.neutral40),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primary50,
                            minimumSize: const Size(78, 40),
                            maximumSize: const Size(98, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'Follow',
                            style: AppTextStyle.label
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
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
                      style: AppTextStyle.h5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.neutral90),
                    ),
                    Text(
                      '${recipe.extendedIngredients!.length.toString()} items',
                      style: AppTextStyle.label
                          .copyWith(color: AppColors.neutral40),
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: recipe.extendedIngredients!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            height: 76.0,
                            decoration: BoxDecoration(
                                color: AppColors.neutral10,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
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
                                            'https://spoonacular.com/cdn/ingredients_100x100/${recipe.extendedIngredients![index].image}'),
                                      ),
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            recipe.extendedIngredients![index]
                                                .aisle!,
                                            style: AppTextStyle.label.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.neutral60),
                                          ),
                                          Text(
                                            recipe.extendedIngredients![index]
                                                .name!
                                                .lowUp(),
                                            style: AppTextStyle.paragraph
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.neutral90),
                                          ),
                                        ]),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text(
                                      '${recipe.extendedIngredients![index].measures!.metric!.amount!.toString()} ${recipe.extendedIngredients![index].measures!.metric!.unitShort}',
                                      style: AppTextStyle.label.copyWith(
                                          color: AppColors.neutral60)),
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
