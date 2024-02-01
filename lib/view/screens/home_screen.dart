import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saidlity/core/manager/assets_manager.dart';
import 'package:saidlity/core/manager/route_manager.dart';
import 'package:saidlity/core/styles/app_colors.dart';
import 'package:saidlity/core/styles/app_fonts.dart';
import 'package:saidlity/data/data_source/remote_data_source.dart';
import 'package:saidlity/data/repos/home/home_repo.dart';
import 'package:saidlity/data/repos/home/home_repo_impl.dart';
import 'package:saidlity/view/screens/product_details_screen.dart';
import 'package:saidlity/view/widgets/custom_popular_item.dart';
import 'package:saidlity/view_model/home/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> bannersData = [
    AssetsManager.banner1,
    AssetsManager.banner2,
    AssetsManager.banner3,
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.of(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * .02,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      autoPlay: true,
                      height: screenSize.height * .18,
                      viewportFraction: 1,
                    ),
                    items: bannersData.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * .04,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                image,
                                width: screenSize.width,
                                fit: BoxFit.fill,
                                height: screenSize.height * .22,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: screenSize.height * .007,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        bannersData.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 350,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: selectedIndex == i
                                ? AppColors.primaryColor
                                : Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(
                              180,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.width * .04,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * .03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * .04,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Categories',
                        style: AppFont.getTitleMidFont(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * .04,
                    ),
                    child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: screenSize.height * .01,
                      mainAxisSpacing: screenSize.height * .01,
                      childAspectRatio: 1 / 1.2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        cubit.categoriesData.length,
                        (index) {
                          return InkWell(
                            onTap: () {
                              cubit.getCategoryProductsData(
                                  cubit.categoriesData[index].id!);
                              cubit.categoryName =
                                  cubit.categoriesData[index].name!;
                              Navigator.pushNamed(
                                context,
                                AppRoutes.productScreen,
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  cubit.categoriesData[index].image!,
                                  width: screenSize.width * .15,
                                  height: screenSize.width * .15,
                                ),
                                SizedBox(
                                  height: screenSize.height * .005,
                                ),
                                Text(
                                  cubit.categoriesData[index].name!,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: AppFont.getSubtitle1(
                                    context,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * .04,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Most popular',
                        style: AppFont.getTitleMidFont(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * .04,
                    ),
                    child: SizedBox(
                      height: screenSize.height * .17,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => ProductDetailsScreen(
                                productModel: cubit.popularProducts[index],
                              ),
                            );
                          },
                          child: CustomPopularItem(
                            productModel: cubit.popularProducts[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: screenSize.width * .04,
                        ),
                        itemCount: (cubit.popularProducts.length / 2).round(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * .04,
                    ),
                    child: SizedBox(
                      height: screenSize.height * .17,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => ProductDetailsScreen(
                                productModel: cubit.popularProducts[index +
                                    (cubit.popularProducts.length -
                                        (cubit.popularProducts.length / 2)
                                            .round() +
                                        oddOReven(
                                            cubit.popularProducts.length))],
                              ),
                            );
                          },
                          child: CustomPopularItem(
                            productModel: cubit.popularProducts[index +
                                (cubit.popularProducts.length -
                                    (cubit.popularProducts.length / 2).round() +
                                    oddOReven(cubit.popularProducts.length))],
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: screenSize.width * .04,
                        ),
                        itemCount: cubit.popularProducts.length -
                            (cubit.popularProducts.length / 2).round(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .11,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  int oddOReven(int num) {
    if (num % 2 == 0) {
      return 0;
    } else {
      return 1;
    }
  }
}
