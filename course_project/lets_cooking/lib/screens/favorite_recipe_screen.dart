import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lets_cooking/screens/recipe_details_screen.dart';

import '../main.dart';
import '../models/recipe_details_model.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  const FavoriteRecipesScreen({Key? key}) : super(key: key);
  static const routeName = '/FavoriteRecipesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Favorite Recipes',
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ValueListenableBuilder(
              valueListenable:
                  Hive.box<RecipeDetailsModel>(favoriteRecipesBox).listenable(),
              builder: (context, Box<RecipeDetailsModel> box, _) {
                if (box.values.isEmpty) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pop();
                  });
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0),
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    RecipeDetailsModel? res = box.getAt(index);
                    return Column(
                      children: [
                        GestureDetector(
                          onLongPress: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Are you sure?',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              action: SnackBarAction(
                                  label: 'Delete',
                                  onPressed: () {
                                    Hive.box<RecipeDetailsModel>(
                                            favoriteRecipesBox)
                                        .delete(res!.id!);
                                  }),
                            ));
                          },
                          onTap: () {
                            Navigator.pushNamed(
                                context, RecipeDetailsScreen.routeName,
                                arguments: res);
                          },
                          child: Container(
                            height: 124.0,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
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
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        //Text(res!),
                      ],
                    );
                  },
                );
              }),
        ));
  }
}
