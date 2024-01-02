import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_smart/consts/Widgets/title.dart';

class CustomResultNotFound extends StatelessWidget {
  const CustomResultNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTitle(title: "Not Result Found", fontSize: 30),
          SizedBox(
            width: 10,
          ),
          Icon(
            IconlyLight.search,
            size: 45,
          ),
        ],
      ),
    );
  }
}
