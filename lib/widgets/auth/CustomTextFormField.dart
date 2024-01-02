import 'package:flutter/material.dart';
import 'package:shop_smart/consts/AppColor.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth({
    super.key,
    required this.label,
    required this.suffix,
    required this.controller,
    required this.validator,
    this.preffix,
    required this.obscureText,
  });

  final String label;
  final IconData suffix;
  final IconData? preffix;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.blueColor.withOpacity(0.1),
        labelStyle:
            TextStyle(color: AppColor.darkScaffoldColor.withOpacity(0.5)),
        labelText: label,
        suffixIcon: Icon(
          preffix,
          size: 30,
          color: AppColor.darkPrimary.withOpacity(0.5),
        ),
        prefixIcon: Icon(
          suffix,
          size: 30,
          color: AppColor.darkPrimary.withOpacity(0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColor.darkPrimary.withOpacity(0.1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColor.darkPrimary.withOpacity(0.1),
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColor.darkPrimary.withOpacity(0.1),
            )),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColor.redColor,
          ),
        ),
      ),
    );
  }
}
