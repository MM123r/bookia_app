import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/features/home/data/models/get_arrivals_books_response/product.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_state.dart';
import 'package:bookia_app/features/wishlist/widgets/empty_wish_list.dart';
import 'package:bookia_app/features/wishlist/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WishlistScreen extends StatefulWidget {
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetWishListlsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is GetWishlistLoadingState ||
            state is RemoveFromWishListlsLoadingState) {
          showLoadingDialog(context);
        } else if(state is GetWishlistLoadedState){
          Navigator.pop(context);
        } 
        else if (
            state is RemoveFromWishListlsLoadedState) {
          Navigator.pop(context);
          context.read<HomeBloc>().add(GetWishListlsEvent());
        }
      },
      builder: (context, state) {
        var wishlist = context.read<HomeBloc>().wishlist;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Wishlis",
              textAlign: TextAlign.center,
            ),
          ),
          body: wishlist.isEmpty
              ? const EmptyWishList()
              : wishListBuilder(wishlist),
        );
      },
    );
  }

  wishListBuilder(List<Product> wishlist) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return WishListItem(
              product: wishlist[index],
              onRemove: () {
                context.read<HomeBloc>().add(RemoveFromWishListlsEvent(
                    productId: wishlist[index].id ?? 0));
              },
              onAddToCart: () {},
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 30,
            );
          },
          itemCount: wishlist.length),
    );
  }
}
