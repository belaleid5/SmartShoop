import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Profile/userProvider.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';
import 'package:shop_smart/consts/Widgets/title.dart';

class CustomProfileData extends StatelessWidget {
  const CustomProfileData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 0.19,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.network(
              userProvider.userModel!.userImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(
              title: userProvider.userModel!.userName,
              fontSize: 24,
            ),
            CustomSubTitle(
                fontSize: 18,
                fontWeight: FontWeight.w200,
                subTitle: userProvider.userModel!.userEmail),
          ],
        )
      ],
    );
  }
}
