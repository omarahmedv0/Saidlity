import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:saidlity/core/manager/assets_manager.dart';
import 'package:saidlity/core/manager/route_manager.dart';
import 'package:saidlity/core/styles/app_colors.dart';
import 'package:saidlity/core/styles/app_fonts.dart';
import 'package:saidlity/data/models/product_model.dart';
import 'package:saidlity/view/screens/product_details_screen.dart';
import 'package:saidlity/view/widgets/custom_product_item.dart';
import 'package:saidlity/view/widgets/custom_text_form_field.dart';
import 'package:saidlity/view_model/home/home_cubit.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    HomeCubit.of(context).searchData = [];
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.of(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              leading: IconButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.white,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: Text(
                cubit.categoryName,
                style: AppFont.getTitleMidFont(context),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: screenSize.width * .04,
                      left: screenSize.width * .04,
                      top: screenSize.height * .02,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: screenSize.height * .05,
                            child: customTextFormField(
                              onChanged: (text) {
                                setState(() {
                                  cubit.filterProductsData(text);
                                });
                              },
                              context,
                              controller: searchController,
                              hintText: 'Search',
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: Colors.grey.withOpacity(.4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * .02,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(13),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AssetsManager.searchIcon,
                              width: screenSize.width * .05,
                              height: screenSize.width * .05,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .02,
                  ),
                  ConditionalBuilder(
                    condition: state is GetCategoryProductsDataLoading,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height * .2,
                      ),
                      child: Center(
                        child: LottieBuilder.asset(
                          AnimationsAssetsManager.loading,
                          width: screenSize.width * .4,
                        ),
                      ),
                    ),
                    fallback: (context) => ConditionalBuilder(
                      condition: cubit.productsData.isEmpty,
                      builder: (context) => Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height * .1,
                        ),
                        child: Center(
                          child: LottieBuilder.asset(
                            AnimationsAssetsManager.empty,
                            width: screenSize.width * .7,
                          ),
                        ),
                      ),
                      fallback: (context) => Padding(
                        padding: EdgeInsets.only(
                          right: screenSize.width * .04,
                          left: screenSize.width * .04,
                        ),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisSpacing: 15,
                          childAspectRatio: .9 / 1.1,
                          crossAxisCount: 2,
                          mainAxisSpacing:
                              MediaQuery.of(context).size.height / 90,
                          children: List.generate(
                              cubit.searchData.isNotEmpty
                                  ? cubit.searchData.length
                                  : cubit.productsData.length, (i) {
                            return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => ProductDetailsScreen(
                                    productModel: cubit.searchData.isNotEmpty
                                        ? cubit.searchData[i]
                                        : cubit.productsData[i],
                                  ),
                                );
                              },
                              child: CustomProductItem(
                                productModel:  cubit.searchData.isNotEmpty
                                        ? cubit.searchData[i]
                                        : cubit.productsData[i],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
