import 'package:flutter/material.dart';
import 'package:saidlity/core/manager/assets_manager.dart';
import 'package:saidlity/core/styles/app_colors.dart';
import 'package:saidlity/core/styles/app_fonts.dart';
import 'package:saidlity/data/models/product_model.dart';

class CustomPopularItem extends StatelessWidget {
  CustomPopularItem({
    super.key,
    required this.productModel,
  });
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(
            1,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.4),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                productModel.image!,
                width: screenSize.width * .25,
                height: screenSize.width * .22,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * .008,
        ),
        SizedBox(
          width: screenSize.width * .25,
          child: Text(
            productModel.name!,
            maxLines: 1,
            textAlign: TextAlign.start,
            style: AppFont.getLabelFont(
              context,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.2,
            ),
          ),
        ),
        SizedBox(
          width: screenSize.width * .25,
          child: Text(
            productModel.price!,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: AppFont.getLabelFont(
              context,
              fontSize: 14,
              fontColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
