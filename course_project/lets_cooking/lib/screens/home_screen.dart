import 'package:flutter/material.dart';
import 'package:lets_cooking/extensions/string_low_up.dart';
import 'package:marquee/marquee.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';
import '../content_state.dart';
import '../models/recipes_model.dart';
import '../network/api_service.dart';
import '../settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
    final response = await service.getRandomRecipes(1);
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
    for (var element in Settings.mealTypes.getRange(0, 2)) {
      final response = await service.getRandomRecipes(3, element);
      popularRecipes[element] = response.result!;
      print(popularRecipes[element]);
    }
    return popularRecipes;
  }

  @override
  void initState() {
    loadTrendRecipes();
    //loadPopularRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Find best recipe for cooking',
                  style: AppTextStyle.h4.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.neutral90),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                style: AppTextStyle.h5.copyWith(color: AppColors.neutral90),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search recipes',
                    hintStyle:
                        AppTextStyle.label.copyWith(color: AppColors.neutral30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: AppColors.neutral20),
                    )),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Trending now 🔥',
                      style: AppTextStyle.h5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.neutral90)),
                  Row(
                    children: [
                      Text('See all',
                          style: AppTextStyle.label.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary50)),
                      const Icon(
                        Icons.arrow_forward,
                        color: AppColors.primary50,
                      ),
                    ],
                  ),
                ],
              ),
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
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Container(
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
                                Positioned(
                                  top: 8.0,
                                  left: 8.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.neutral90.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8.0),
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
                                          '4.5',
                                          style: AppTextStyle.label.copyWith(
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
                                  child: Container(
                                    height: 32.0,
                                    width: 32.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.neutral10,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () {},
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(
                                            Icons.bookmark,
                                            size: 22.0,
                                            color: AppColors.neutral90,
                                          )),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8.0,
                                  right: 8.0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.neutral90.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    width: 80.0,
                                    height: 28.0,
                                    child: Text(
                                      '${trendRecipes.recipes![index].readyInMinutes} min',
                                      style: AppTextStyle.label.copyWith(
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
                                text:
                                    '${trendRecipes.recipes![index].title!}   ||',
                                style: AppTextStyle.paragraph.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.neutral90),
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
                              Text(
                                trendRecipes.recipes![index].creditsText != null
                                    ? 'By ${trendRecipes.recipes![index].creditsText!.replaceAll('.', ' ').split(' ').first} ${trendRecipes.recipes![index].creditsText!.replaceAll('.', ' ').split(' ').last}'
                                    : 'By Amore Mio',
                                style: AppTextStyle.small
                                    .copyWith(color: AppColors.neutral40),
                              ),
                            ])
                          ]);
                    }),
              ),
              Text('Popular category', style: AppTextStyle.h5
                  .copyWith(fontWeight: FontWeight.bold, color: AppColors.neutral90)),
              const SizedBox(height: 24.0,),
              FutureBuilder<Map<String, RecipesModel>>(
                  future: loadPopularRecipes(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? DefaultTabController(
                            length: snapshot.data!.length,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TabBar(
                                  isScrollable: true,
                                  tabs: snapshot.data!.keys
                                      .map((e) => Container(
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
                                    children: snapshot.data!.values.map((e) {
                                      return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: e.recipes!.length,
                                          itemBuilder: (context, index) {
                                            return Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16.0),
                                                  child: Container(
                                                    height: 176.0,
                                                    width: 150.0,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 6.0),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.neutral10,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    12.0)),
                                                    child: Center(
                                                      child: Text(
                                                          e.recipes![index]
                                                              .title!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          style: AppTextStyle
                                                              .label
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: AppColors
                                                                      .neutral90)),
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
                                                          color: Color.fromRGBO(
                                                              32, 32, 32, 0.15),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              55.0),
                                                      border: Border.all(
                                                          width: 16.0,
                                                          color: AppColors
                                                              .neutral10
                                                              .withOpacity(
                                                                  0.95)),
                                                      image: DecorationImage(
                                                        image: NetworkImage(e
                                                            .recipes![index]
                                                            .image!),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 12.0,
                                                  right: 28.0,
                                                  child: Container(
                                                    height: 32.0,
                                                    width: 32.0,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Center(
                                                      child: IconButton(
                                                          onPressed: () {},
                                                          padding:
                                                              EdgeInsets.zero,
                                                          icon: const Icon(
                                                            Icons.bookmark,
                                                            size: 22.0,
                                                            color: AppColors
                                                                .neutral90,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 12.0,
                                                  left: 12.0,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Time',
                                                        style: AppTextStyle
                                                            .small
                                                            .copyWith(
                                                                color: AppColors
                                                                    .neutral30),
                                                      ),
                                                      Text(
                                                        '${e.recipes![index].readyInMinutes} min',
                                                        style: AppTextStyle
                                                            .small
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .neutral90),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text('Error');
                  }),
            ]),
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
