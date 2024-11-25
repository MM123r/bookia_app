import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/features/cart/data/models/get_cart_response/cart_item.dart';
import 'package:bookia_app/features/cart/widgets/wish_list_item.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_state.dart';
import 'package:bookia_app/features/wishlist/widgets/empty_wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
            state is RemoveFromCartLoadingState) {
          showLoadingDialog(context);
        } else if(state is GetCartLoadedState){
          Navigator.pop(context);
        } 
        else if (
            state is RemoveFromCartLoadedState) {
          Navigator.pop(context);
          context.read<HomeBloc>().add(GetWishListlsEvent());
        }
      },
      builder: (context, state) {
        var cart = context.read<HomeBloc>().cartResponse;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Cart",
              textAlign: TextAlign.center,
            ), 
          ),
          body: cart?.data?.cartItems?.isEmpty==true
              ? const EmptyWishList()
              : wishListBuilder(cart?.data?.cartItems??[]),
        );
      },
    );
  }

  wishListBuilder(List<CartItem> cartlist) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return CartItemWidget(
              product: cartlist[index],
              onRemove: () {
                // context.read<HomeBloc>().add(RemoveFromCartEvent(
                //     productId: cartlist[index]. ?? 0));
              },
              onAddToCart: () {},
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
