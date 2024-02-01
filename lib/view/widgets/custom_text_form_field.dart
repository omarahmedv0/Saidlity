import 'package:flutter/material.dart';
import 'package:saidlity/core/styles/app_colors.dart';
import 'package:saidlity/core/styles/app_fonts.dart';

Widget customTextFormField(BuildContext context,
    {String? labelText,
    String? hintText,
    Widget? prefixIcon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextEditingController? controller,
    Widget? suffixIcon,
    
    bool obscureText = false,void Function(String)? onChanged,}) {

  return TextFormField(
    validator: validator,
    style: AppFont.getCaptionFont(
      context,
      fontColor: Colors.black,
    ),
    keyboardType: keyboardType,
    obscureText: obscureText,
    onChanged:onChanged ,
    controller: controller,
    cursorColor: AppColors.primaryColor,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      hintText: hintText,
      hintStyle: AppFont.getCaptionFont(context),
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: AppFont.getCaptionFont(
        context,
        fontColor: Colors.black,
      ),
      contentPadding: const EdgeInsets.only(
        left: 15,
        right: 10,
        top: 0,
        bottom: 0,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
        borderSide: BorderSide(
          color:Colors.grey.withOpacity(.4),
        ),
      ),
      suffixIcon: suffixIcon,
      border: const UnderlineInputBorder(
        borderSide: BorderSide.none,
      ),
    ),
  );
}
