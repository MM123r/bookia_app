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
  final int productId;

  RemoveFromCartEvent({required this.productId});
}
