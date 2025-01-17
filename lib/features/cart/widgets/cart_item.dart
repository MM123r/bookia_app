import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/cart/data/models/response/get_cart_response/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.product,
    required this.onRemove,
    required this.onAddToCart,
    required this.onAddQuantity,
    required this.onMinusQuantity,
  });

  final CartItem product;
  final Function() onRemove;
  final Function() onAddToCart;
  final Function() onAddQuantity;
  final Function() onMinusQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            product.itemProductImage ?? "",
            width: 100,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    product.itemProductName ?? "",
                    style: getFont18TextStyle(context,),
                  )),
                  const Gap(5),
                  GestureDetector(
                      onTap: onRemove,
                      child: SvgPicture.asset(AppAssets.removeSvg,)),
                ],
              ),
              const Gap(10),
              Text(
                "${product.itemProductPriceAfterDiscount ?? product.itemProductPrice} \$",
                style: getFont18TextStyle(context,),
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onMinusQuantity,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.borderColor),
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  SizedBox(
                      width: 40,
                      child: Text(
                        product.itemQuantity.toString(),
                        textAlign: TextAlign.center,
                        style: getFont18TextStyle(context,),
                      )),
                  GestureDetector(
                    onTap: onAddQuantity,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.borderColor),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
