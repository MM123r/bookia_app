import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/cart/data/models/response/get_cart_response/cart_item.dart';
import 'package:bookia_app/features/cart/page/checkout_screen.dart';
import 'package:bookia_app/features/cart/widgets/cart_item.dart';
import 'package:bookia_app/features/cart/widgets/empty_cart.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is GetCartLoadingState ||
            state is RemoveFromCartLoadingState ||
            state is UpdateCartLoadingState ||
            state is CheckoutLoadingState) {
          showLoadingDialog(context);
        } else if (state is GetCartLoadedState) {
          Navigator.pop(context);
        } else if (state is UpdateCartLoadedState) {
          Navigator.pop(context);
        } else if (state is RemoveFromCartLoadedState) {
          Navigator.pop(context);
          context.read<HomeBloc>().add(GetCartEvent());
        } else if (state is CheckoutLoadedState) {
          String cartTotal =
              context.read<HomeBloc>().cartResponse?.data?.total.toString() ??
                  "";
          Navigator.pop(context);
          pushTo(context, CheckoutScreen(total: cartTotal));
        }
      },
      builder: (context, state) {
        var cart = context.read<HomeBloc>().cartResponse;
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: const Text(
                "Cart",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          bottomNavigationBar: (cart?.data?.cartItems?.isNotEmpty == true)
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Tota:",
                            style: getFont18TextStyle(context,),
                          ),
                          const Spacer(),
                          Text(
                            "${cart?.data?.total}\$",
                            style: getFont18TextStyle(context,),
                          ),
                        ],
                      ),
                      const Gap(16),
                      CustomButton(
                          text: "ChechOut",
                          onPressed: () {
                            context.read<HomeBloc>().add(CheckoutEvent());
                          })
                    ],
                  ),
                )
              : const SizedBox(),
          body: cart?.data?.cartItems?.isEmpty == true
              ? const EmptyCart()
              : cartListBuilder(cart?.data?.cartItems ?? []),
        );
      },
    );
  }

  cartListBuilder(List<CartItem> cartlist) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return CartItemWidget(
              product: cartlist[index],
              onRemove: () {
                context.read<HomeBloc>().add(RemoveFromCartEvent(
                    cartItemId: cartlist[index].itemId ?? 0));
              },
              onAddToCart: () {},
              onAddQuantity: () {
                if ((cartlist[index].itemQuantity ?? 0) <
                    (cartlist[index].itemProductStock ?? 0)) {
                  context.read<HomeBloc>().add(UpdateCartEvent(
                      cartItemId: cartlist[index].itemId ?? 0,
                      quantity: (cartlist[index].itemQuantity ?? 0) + 1));
                } else {
                  showSuccessDialog(context, "Item is out of stock");
                }
              },
              onMinusQuantity: () {
                if ((cartlist[index].itemQuantity ?? 0) > 1) {
                  context.read<HomeBloc>().add(UpdateCartEvent(
                      cartItemId: cartlist[index].itemId ?? 0,
                      quantity: (cartlist[index].itemQuantity ?? 0) - 1));
                }
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 30,
            );
          },
          itemCount: cartlist.length),
    );
  }
}
