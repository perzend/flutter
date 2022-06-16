import 'package:flutter/material.dart';
import 'package:lets_cooking/constants/text_style.dart';

import '../constants/colors.dart';
import '../states/content_state.dart';
import '../models/recipes_model.dart';
import '../network/api_service.dart';
import '../settings/settings.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/WelcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;

  var trendRecipes = RecipesModel();
  var popularRecipes = <String, RecipesModel>{};

  var isEnabled = false;

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
        if (response.result != null) {
          state = ContentState.success;
          isEnabled = true;
        } else {
          state = ContentState.empty;
        }
        trendRecipes = response.result!;
      });
    }
  }

  Future<void> loadPopularRecipes() async {
    setState(() {
      state = ContentState.loading;
    });
    for (var category in Settings.popularCategories) {
      final response = await service.getRandomRecipes(
          Settings.numberRecipesInPopularCategory, category);
      if (response.hasError) {
        setState(() {
          state = ContentState.failure;
        });
      } else {
        setState(() {
          if (response.result != null) {
            state = ContentState.success;
            isEnabled = true;
          } else {
            state = ContentState.empty;
          }

          popularRecipes[category] = response.result!;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadTrendRecipes();
    loadPopularRecipes();
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return Scaffold(
          backgroundColor: AppColors.neutral90,
          body: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/welcome_screen_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: AppColors.white),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '60k+',
                          style: AppTextStyle.bodyText1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          'Premium recipes',
                          style: AppTextStyle.bodyText1
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Let\'s\nCooking',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.heading.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        'Find best recipes for cooking',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bodyText1
                            .copyWith(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      ElevatedButton(
                        onPressed: isEnabled
                            ? () {
                                Navigator.pushReplacementNamed(
                                    context, HomeScreen.routeName, arguments: {
                                  'trendRecipes': trendRecipes,
                                  'popularRecipes': popularRecipes
                                });
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primary50,
                          onSurface: AppColors.neutral50,
                          fixedSize: const Size(206, 54),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start cooking',
                              style: AppTextStyle.bodyText1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            const Icon(Icons.arrow_forward_outlined),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 48.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      case ContentState.loading:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case ContentState.empty:
        return const Scaffold(
          body: Center(
            child: Text('Sorry, no recipes yet'),
          ),
        );
      case ContentState.failure:
        return const Scaffold(
          body: Center(
            child: Text(
              'Oops, something wrong',
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      default:
        return const Scaffold(
          body: Center(
            child: Text('Data don\'t loaded'),
          ),
        );
    }
  }
}