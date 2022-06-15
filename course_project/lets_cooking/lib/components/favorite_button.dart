import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lets_cooking/main.dart';
import 'package:lets_cooking/models/recipe_details_model.dart';

import '../constants/colors.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton(
      {Key? key,
      required this.isFavorite,
      required this.bgColor,
      required this.recipeDetails})
      : super(key: key);
  final RecipeDetailsModel recipeDetails;
  final bool isFavorite;
  final Color? bgColor;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool _isFavorite;

  @override
  void initState() {
    _isFavorite = widget.isFavorite;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      width: 32.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Center(
        child: IconButton(
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
                widget.recipeDetails.isFavorite = _isFavorite;
              });
              if (Hive.box<RecipeDetailsModel>(favoriteRecipesBox)
                  .containsKey(widget.recipeDetails.id!)) {
                Hive.box<RecipeDetailsModel>(favoriteRecipesBox)
                    .delete(widget.recipeDetails.id!);
                return;
              }
              Hive.box<RecipeDetailsModel>(favoriteRecipesBox)
                  .put(widget.recipeDetails.id!, widget.recipeDetails);
            },
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.bookmark,
              size: 22.0,
              color: _isFavorite ? AppColors.primary50 : AppColors.neutral90,
            )),
      ),
    );
  }
}
