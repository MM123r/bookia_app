import 'dart:developer';

import 'package:bookia_app/core/services/local/app_local_storage.dart';
import 'package:bookia_app/core/services/remote/dio_provider.dart';
import 'package:bookia_app/core/services/remote/endpoints.dart';
import 'package:bookia_app/features/cart/data/models/request/place_order_params.dart';
import 'package:bookia_app/features/cart/data/models/response/get_cart_response/get_cart_response.dart';

class CartRepo {
  static Future<GetCartResponse?> getCart() async {
    try {
      var response = await DioProvider.get(
          endpoint: AppEndpoints.getCart,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(AppLocalStorage.token)}"
          });

      if (response.statusCode == 200) {
        // log("-----1------");
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addToCart({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.addToCart,
          data: {
            "product_id": productId
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(AppLocalStorage.token)}"
          });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> removFromCart({required int cartIemId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.removFromCart,
          data: {
            "cart_item_id": cartIemId
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(AppLocalStorage.token)}"
          });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<GetCartResponse?> updateCartItemQuantity(
      {required int cartItemId, required int quantity}) async {
    try {
      var response =
          await DioProvider.post(endpoint: AppEndpoints.updateCart, data: {
        "cart_item_id": cartItemId,
        "quantity": quantity,
      }, headers: {
        "Authorization":
            "Bearer ${AppLocalStorage.getData(AppLocalStorage.token)}"
      });

      if (response.statusCode == 201) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> checkout() async {
    try {
      var response = await DioProvider.get(
          endpoint: AppEndpoints.checkout,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(AppLocalStorage.token)}"
          });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> placeOrder({required PlaceOrderParams params}) async {
    log("-------Start Order-------");
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.placeOrder,
          data: params.toJson(),
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(AppLocalStorage.token)}"
          });

      if (response.statusCode == 201) {
        log("-------Order placed successfully-------");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  //code Ahmed

//   static Future<bool> placeOrder({required PlaceOrderParams params}) async {
//   log("-------------Starting placeOrder-------------");
//   try {
//     var response = await DioProvider.post(
//       endpoint: AppEndpoints.placeOrder,
//       data: params.toJson(),
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer ${AppLocalStorage.getData(AppLocalStorage.token)}',
//       },
//     );
//     if (response.statusCode == 201) {
//       log("-------------Order placed successfully-------------");
//       return true;
//     } else {
//       return false;
//     }
//   } on Exception catch (e) {
//     log("Error occurred: $e");
//     return false;
//   }
// }



 


}
