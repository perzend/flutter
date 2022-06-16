import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SearchRecipes extends StatelessWidget {
  const SearchRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.headline5,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search recipes',
        hintStyle: Theme.of(context).textTheme.bodyText2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.neutral20),
        ),
      ),
    );
  }
}
