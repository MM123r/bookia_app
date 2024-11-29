class HomeState {}

class HomeInitialState extends HomeState {}

// new arrivals
class GetSlidersLoadingState extends HomeState {}

class GetSlidersLoadedState extends HomeState {}

class NewArrivalsBooksLoadingState extends HomeState {}

class NewArrivalsBooksLoadedState extends HomeState {}

// wishlist
class GetWishlistLoadingState extends HomeState {}

class GetWishlistLoadedState extends HomeState {}

//
class RemoveFromWishListlsLoadingState extends HomeState {}

class RemoveFromWishListlsLoadedState extends HomeState {}

//
class AddToWishListlsLoadingState extends HomeState {}

class AddToWishListlsLoadedState extends HomeState {}

//Cart

class GetCartLoadingState extends HomeState {}

class GetCartLoadedState extends HomeState {}

class UpdateCartLoadingState extends HomeState {}

class UpdateCartLoadedState extends HomeState {}

class RemoveFromCartLoadingState extends HomeState {}

class RemoveFromCartLoadedState extends HomeState {}

class AddToCartLoadingState extends HomeState {}

class AddToCartLoadedState extends HomeState {}

// Checkout

class CheckoutLoadingState extends HomeState {}

class CheckoutLoadedState extends HomeState {}

// PlaceOrder

class PlaceOrderLoadingState extends HomeState {}

class PlaceOrderLoadedState extends HomeState {}

class HomeErrorState extends HomeState {
  String message;
  HomeErrorState({required this.message});
}
