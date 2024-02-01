import 'package:flutter/material.dart';
import 'package:saidlity/core/manager/assets_manager.dart';
import 'package:saidlity/core/styles/app_colors.dart';
import 'package:saidlity/core/styles/app_fonts.dart';
import 'package:saidlity/data/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({
    super.key,
    required this.productModel,
  });
  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Image.network(
                productModel.image!,
                height: screenSize.height * .4,
                width: screenSize.width,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: screenSize.height * .02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * .04,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name!,
                  style: AppFont.getTitleSmallFont(
                    context,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * .01,
                ),
                Text(
                  'EGP ${productModel.price}',
                  style: AppFont.getSubtitle1(
                    context,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Available quantity',
                          style: AppFont.getCaptionFont(
                            context,
                            fontColor: Colors.black,
                          ),
                        ),
                        Text(
                          '${productModel.count} Piece',
                          style: AppFont.getSubtitle1(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
