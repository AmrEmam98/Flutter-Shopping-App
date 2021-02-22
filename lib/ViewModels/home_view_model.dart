import 'package:flutter/cupertino.dart';
import 'package:online_shopping_store/provider/cart_favorite_provider.dart';
import 'package:provider/provider.dart';

class HomeViewModel {
  BuildContext context;
  HomeViewModel({this.context});
  int getCartCount() =>
      Provider.of<CartFavoriteProvider>(context,listen: true).cartProducts.length;
}
