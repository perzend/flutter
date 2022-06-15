import 'package:flutter/material.dart';
import 'package:lets_cooking/extensions/string_low_up.dart';
import 'package:lets_cooking/models/recipes_model.dart';

import '../components/favorite_button.dart';
import '../constants/colors.dart';
import '../constants/text_style.dart';
import '../screens/recipe_details_screen.dart';

class PopularCategory extends StatefulWidget {
  const PopularCategory({Key? key, required this.popularRecipes})
      : super(key: key);
  final Map<String, RecipesModel> popularRecipes;

  @override
  State<PopularCategory> createState() => _PopularCategoryState();
}

class _PopularCategoryState extends State<PopularCategory> {
  @override
  Widget build(BuildContext context) {
    final popularRecipes = widget.popularRecipes;
    return DefaultTabController(
      length: popularRecipes.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            isScrollable: true,
            tabs: popularRecipes.keys
                .map((e) => SizedBox(
                      height: 34.0,
                      width: 82.0,
                      child: Tab(
                        text: e.lowUp(),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 234.0,
            child: TabBarView(
              children: popularRecipes.values.map((e) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: e.recipes!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RecipeDetailsScreen.routeName,
                              arguments: e.recipes![index]);
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Container(
                                height: 176.0,
                                width: 150.0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                decoration: BoxDecoration(
                                    color: AppColors.neutral10,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Center(
                                  child: Text(e.recipes![index].title!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: AppTextStyle.bodyText2.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.neutral90)),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 121.0,
                              left: 20.0,
                              child: Container(
                                width: 110.0,
                                height: 110.0,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 8),
                                      blurRadius: 25,
                                      color: Color.fromRGBO(32, 32, 32, 0.15),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(55.0),
                                  border: Border.all(
                                      width: 16.0,
                                      color: AppColors.neutral10
                                          .withOpacity(0.95)),
                                  image: e.recipes![index].image != null
                                      ? DecorationImage(
                                          image: NetworkImage(
                                              e.recipes![index].image!),
                                          fit: BoxFit.cover,
                                        )
                                      : const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/no_image_placeholder.png'),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 12.0,
                              right: 28.0,
                              child: FavoriteButton(
                                recipeDetails: e.recipes![index],
                                isFavorite: e.recipes![index].isFavorite,
                                bgColor: AppColors.white,
                              ),

                              // Container(
                              //   height: 32.0,
                              //   width: 32.0,
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //     color: AppColors.white,
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
                              bottom: 12.0,
                              left: 12.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time',
                                    style: AppTextStyle.caption
                                        .copyWith(color: AppColors.neutral30),
                                  ),
                                  Text(
                                    '${e.recipes![index].readyInMinutes} min',
                                    style: AppTextStyle.caption.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.neutral90),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
