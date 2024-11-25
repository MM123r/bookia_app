import 'dart:developer';

import 'package:bookia_app/core/services/local/app_local_storage.dart';
import 'package:bookia_app/core/services/remote/dio_provider.dart';
import 'package:bookia_app/core/services/remote/endpoints.dart';
import 'package:bookia_app/features/wishlist/data/models/get_wishlist_response/get_wishlist_response.dart';

class WishlistRepo {
  static Future<GetWishlistResponse?> getwishlis() async {
    try {
      var response = await DioProvider.get(
          endpoint: AppEndpoints.getWishList,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(AppLocalStorage.token)}"
          });

      if (response.statusCode == 200) {
        return GetWishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addTowishlis({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.addToWishList,
          data: {
            "product_id": productId
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

  static Future<bool> removFromwishlis({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.removFromwishlis,
          data: {
            "product_id": productId
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
}
