import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/hive_boxes_names.dart';
import '../models/recipe_details_model.dart';
import '../screens/recipe_details_screen.dart';

class FavoriteRecipes extends StatelessWidget {
  const FavoriteRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
        Hive.box<RecipeDetailsModel>(HiveBoxesNames.favoriteRecipes)
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  RecipeDetailsScreen.routeName,
                                  arguments: res);
                            },
                            child: Container(
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
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            res.title!,
                            style:
                            Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                          ),
                          //Text(res!),
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
