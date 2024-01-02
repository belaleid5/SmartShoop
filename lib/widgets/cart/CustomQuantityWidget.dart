import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Models/cart_model.dart';
import 'package:shop_smart/Providers/CartProvider.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';

class CustomQuantityWidget extends StatelessWidget {
  const CustomQuantityWidget({
    super.key,
    required this.size,
    required this.cartModel,
  });

  final Size size;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: size.width * 0.15,
          height: size.height / 100,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    carProvider.ubdatequantity(
                        productId: cartModel.productId, quantity: index + 1);
                    context.pop(context);
                  },
                  child: Center(
                    child: CustomSubTitle(
                        subTitle: "${index + 1}",
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                );
              },
              separatorBuilder: (context, _) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemCount: 50),
        ),
      ],
    );
  }
}
