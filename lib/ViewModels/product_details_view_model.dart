import 'package:flutter/cupertino.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/new_product_model.dart';
import 'package:online_shopping_store/models/cart_model.dart';
import 'package:online_shopping_store/provider/cart_favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:online_shopping_store/FirebaseServices/products_setter.dart';

class ProductDetailsViewModel {
  BuildContext context;
  ProductSetter productSetter = ProductSetter();

  ProductDetailsViewModel({this.context});

  void addProductToCart(NewProductModel product) {

    CartModel cartModel =
        CartModel( product: product);
    Provider.of<CartFavoriteProvider>(context, listen: false)
        .addProductToCart(cartModel);
  }

  void removeProductFromCart(NewProductModel product) {
    Provider.of<CartFavoriteProvider>(context, listen: false)
        .removeProductFromCart(product);
  }
  void addProductToFirebase(Product product){
    productSetter.addProduct(product);
  }
}
