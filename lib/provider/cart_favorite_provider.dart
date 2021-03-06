import 'package:flutter/cupertino.dart';
import 'package:online_shopping_store/FirebaseServices/products_setter.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/new_product_model.dart';
import 'package:online_shopping_store/models/cart_model.dart';


class CartFavoriteProvider extends ChangeNotifier {
  List<CartModel> cartProducts = List();

  void addProductToCart(CartModel cartModel) {
    cartProducts.add(cartModel);
    notifyListeners();
   // _saveToFirebase();
  }

  void removeProductFromCart(NewProductModel product) {
    for (int i = 0; i < cartProducts.length; i++) {
      if (product.id == cartProducts[i].productId) {
        cartProducts.removeAt(i);
        notifyListeners();
    //    _saveToFirebase();
        break;
      }
    }
    notifyListeners();
  }
  void removeCartItemByIndex(int index){
    NewProductModel product=cartProducts[index].product;
    cartProducts.removeAt(index);
    notifyListeners();
  }

  void increaseCartItemQuantity(int cartIndex){
    cartProducts[cartIndex].orderedQuantity++;
    notifyListeners();
  }
  void decreaseCartItemQuantity(int cartIndex){
    cartProducts[cartIndex].orderedQuantity--;
    notifyListeners();
  }

  double getCartTotalPrice(){
    double sum=0;
    cartProducts.forEach((cartProdcut) {
     sum+= cartProdcut.getTotalPrice();
    });
    return sum;
  }

  void setCartProducts(List<CartModel> cartProducts) {
    this.cartProducts = cartProducts;
  }

  void _saveToFirebase() {
    ProductSetter productSetter = new ProductSetter();
    productSetter.updateCart(cartProducts);
  }
}
