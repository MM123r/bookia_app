import 'package:bookia_app/features/cart/data/models/response/get_cart_response/get_cart_response.dart';
import 'package:bookia_app/features/cart/data/repo/cart_repo.dart';
import 'package:bookia_app/features/home/data/models/get_arrivals_books_response/product.dart';
import 'package:bookia_app/features/home/data/models/get_sliders_reponse/slider.dart';
import 'package:bookia_app/features/home/data/repo/home_repo.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_state.dart';
import 'package:bookia_app/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GetNewArrivalsBooksEvent>(getNewArrivals);
    on<GetSlidersEvent>(getSliders);

    on<GetWishListlsEvent>(getwishlis);
    on<AddToWishListlsEvent>(addTowishlis);
    on<RemoveFromWishListlsEvent>(removFromwishlis);

    on<AddToCartEvent>(addToCart);
    on<RemoveFromCartEvent>(removFromCart);
    on<GetCartEvent>(getCart);

    on<UpdateCartEvent>(updateCart);

    on<CheckoutEvent>(checkout);

    on<PlaceOrderEvent>(placeOrder); 
  // on<PlaceOrderEvent>(placeorder);
    
  }

  List<Product> newArrivalsBooks = [];
  List<Slider> sliders = [];

  List<Product> wishlist = [];
  GetCartResponse? cartResponse;

  Future<void> getNewArrivals(
      GetNewArrivalsBooksEvent event, Emitter<HomeState> emit) async {
    emit(NewArrivalsBooksLoadingState());

    try {
      await HomeRepo.getNewArrivalsBooks().then((value) {
        if (value != null) {
          newArrivalsBooks = value.data?.products ?? [];
          emit(NewArrivalsBooksLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> getSliders(
      GetSlidersEvent event, Emitter<HomeState> emit) async {
    emit(GetSlidersLoadingState());

    try {
      await HomeRepo.getSliders().then((value) {
        if (value != null) {
          sliders = value.data?.sliders ?? [];
          emit(GetSlidersLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

// wishlis
  Future<void> getwishlis(
      GetWishListlsEvent event, Emitter<HomeState> emit) async {
    emit(GetWishlistLoadingState());

    try {
      await WishlistRepo.getwishlis().then((value) {
        if (value != null) {
          wishlist = value.data?.data ?? [];
          emit(GetWishlistLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> addTowishlis(
      AddToWishListlsEvent event, Emitter<HomeState> emit) async {
    emit(AddToWishListlsLoadingState());

    try {
      await WishlistRepo.addTowishlis(productId: event.productId).then((value) {
        if (value) {
          emit(AddToWishListlsLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> removFromwishlis(
      RemoveFromWishListlsEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromWishListlsLoadingState());

    try {
      await WishlistRepo.removFromwishlis(productId: event.productId)
          .then((value) {
        if (value) {
          emit(RemoveFromWishListlsLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

// Cart

  Future<void> getCart(GetCartEvent event, Emitter<HomeState> emit) async {
    emit(GetCartLoadingState());

    try {
      await CartRepo.getCart().then((value) {
        if (value != null) {
          cartResponse = value;
          emit(GetCartLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> addToCart(AddToCartEvent event, Emitter<HomeState> emit) async {
    emit(AddToCartLoadingState());

    try {
      await CartRepo.addToCart(productId: event.productId).then((value) {
        if (value) {
          emit(AddToCartLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> removFromCart(
      RemoveFromCartEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromCartLoadingState());

    try {
      await CartRepo.removFromCart(cartIemId: event.cartItemId).then((value) {
        if (value) {
          emit(RemoveFromCartLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> updateCart(
      UpdateCartEvent event, Emitter<HomeState> emit) async {
    emit(UpdateCartLoadingState());

    try {
      await CartRepo.updateCartItemQuantity(
        cartItemId: event.cartItemId,
        quantity: event.quantity,
      ).then((value) {
        if (value != null) {
          cartResponse = value;
          emit(UpdateCartLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> checkout(CheckoutEvent event, Emitter<HomeState> emit) async {
    emit(CheckoutLoadingState());

    try {
      await CartRepo.checkout().then((value) {
        if (value) {
          emit(CheckoutLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }

  Future<void> placeOrder(
      PlaceOrderEvent event, Emitter<HomeState> emit) async {
    emit(PlaceOrderLoadingState());

    try {
      await CartRepo.placeOrder(params: event.params).then((value) {
        if (value == true) {
          emit(PlaceOrderLoadedState());
        } else {
          emit(HomeErrorState(
              message: 'Unexpected Error occur, please try again'));
        }
      });
    } on Exception {
      emit(HomeErrorState(message: 'Unexpected Error occur, please try again'));
    }
  }  


  // code yosry

// Future<void> placeorder(PlaceOrderEvent event, Emitter<HomeState> emit) async {
//   emit(PlaceOrderLoadingState());
//   try {
//     final value = await CartRepo.placeOrder(params: event.params);
//     if (value == true) {
//       emit(CheckoutLoadedState());
//     } else {
//       emit(HomeErrorState(message: 'Order placement failed, please try again.'));
//     }
//   } on Exception catch (e) {
//     emit(HomeErrorState(message: 'Unexpected Error occurred: $e'));
//   }
// }




}
