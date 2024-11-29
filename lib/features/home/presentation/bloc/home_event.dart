import 'package:bookia_app/features/cart/data/models/request/place_order_params.dart';

class HomeEvent {}

class GetSlidersEvent extends HomeEvent {}

class GetNewArrivalsBooksEvent extends HomeEvent {}

class GetWishListlsEvent extends HomeEvent {}

class AddToWishListlsEvent extends HomeEvent {
  final int productId;

  AddToWishListlsEvent({required this.productId});
}

class RemoveFromWishListlsEvent extends HomeEvent {
  final int productId;

  RemoveFromWishListlsEvent({required this.productId});
}

class GetCartEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {
  final int productId;

  AddToCartEvent({required this.productId});
}

class RemoveFromCartEvent extends HomeEvent {
  final int cartItemId;

  RemoveFromCartEvent({required this.cartItemId});
}

class UpdateCartEvent extends HomeEvent {
  final int cartItemId;
  final int quantity;

  UpdateCartEvent({required this.cartItemId, required this.quantity});
}

class CheckoutEvent extends HomeEvent {}

class PlaceOrderEvent extends HomeEvent {
  final PlaceOrderParams params;

  PlaceOrderEvent({required this.params});
}
