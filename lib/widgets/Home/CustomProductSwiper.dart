import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/constant.dart';

class CustomProductSwiper extends StatelessWidget {
  const CustomProductSwiper({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.24,
      width: double.infinity,
      child: ClipRRect(
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              AppConstatnt.imageSwiper[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: AppConstatnt.imageSwiper.length,
          autoplay: true,
          pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            activeColor: AppColor.redColor,
            activeSize: 16,
            color: Color.fromARGB(255, 67, 8, 243),
          )),
        ),
      ),
    );
  }
}
