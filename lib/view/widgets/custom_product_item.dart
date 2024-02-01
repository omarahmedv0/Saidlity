
import 'package:flutter/material.dart';
import 'package:saidlity/core/styles/app_fonts.dart';
import 'package:saidlity/data/models/product_model.dart';

class CustomProductItem extends StatelessWidget {
  CustomProductItem({
    super.key,
    required this.productModel,
  });
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            productModel.image!,
            width: double.infinity,
            height: screenSize.width * .4,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: screenSize.width * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenSize.width * .4,
              child: Text(
                productModel.name!,
                maxLines: 1,
                style: AppFont.getSubtitle1(
                  context,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        /*  SizedBox(
          height: screenSize.width * 0.01,
        ), */
        Text(
          'EGP ${productModel.price}',
          style: AppFont.getSubtitle1(
            context,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
