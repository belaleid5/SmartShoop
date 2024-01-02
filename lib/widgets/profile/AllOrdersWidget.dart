import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';

class AllOrdersWidget extends StatelessWidget {
  const AllOrdersWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return FittedBox(
            child: IntrinsicWidth(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FancyShimmerImage(
                              height: size.height * 0.1,
                              width: size.height * 0.1,
                              imageUrl:
                                  "https://img.freepik.com/free-psd/black-cap-isolated-background_1409-3415.jpg?size=626&ext=jpg&ga=GA1.1.1809616900.1700058685&semt=sph"),
                        ),
                      ),
                      IntrinsicWidth(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const CustomSubTitle(
                                      subTitle: "ProductTitle", fontSize: 12),
                                  IconButton(
                                    padding: EdgeInsets.only(left: 35),
                                    onPressed: () {},
                                    icon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.clear,
                                          size: 16,
                                          color: AppColor.redColor,
                                        )),
                                  ),
                                ],
                              ),
                              RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                  text: 'Price:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                TextSpan(
                                  text: '11.99',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                  ),
                                ),
                              ])),
                              const CustomSubTitle(
                                  subTitle: "Qty : 10", fontSize: 12),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
