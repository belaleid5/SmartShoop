import 'package:flutter/material.dart';
import 'package:shop_smart/consts/AppColor.dart';

class LoadingManger extends StatelessWidget {
  const LoadingManger(
      {super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) ...[
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          const Center(
            child: CircularProgressIndicator(
              color: AppColor.darkPrimary,
            ),
          )
        ]
      ],
    );
  }
}
