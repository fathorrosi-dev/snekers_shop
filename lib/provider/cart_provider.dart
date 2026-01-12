import 'package:flutter/material.dart';
import 'package:snekers_shop/model/shoe_model.dart';
import 'package:snekers_shop/screen/home_screen/components/shoe_list.dart';

class CartProvider extends ChangeNotifier {
  List<ShoeModel> userCart = [];

  // Get list of shoe
  List<ShoeModel> getShoeList() {
    return shoesList;
  }

  // Get Cart
  List<ShoeModel> getUserCart() {
    return userCart;
  }

  // add item to cart
  void adaItemToCart(ShoeModel shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(ShoeModel shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
