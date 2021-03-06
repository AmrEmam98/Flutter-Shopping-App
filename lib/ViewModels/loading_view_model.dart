import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_store/FirebaseServices/product_retriever.dart';
import 'package:online_shopping_store/constants.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/new_product_model.dart';
import 'package:online_shopping_store/models/ProductModels/product_factory.dart';
import 'package:online_shopping_store/models/cart_model.dart';
import 'package:online_shopping_store/provider/cart_favorite_provider.dart';
import 'package:online_shopping_store/provider/product_provider.dart';
import 'package:online_shopping_store/screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoadingViewModel {
  BuildContext context;
  ProductsRetriever _productsRetriever = ProductsRetriever();
  List<Product> products = List();
  List<CartModel> cartModels = List();

  LoadingViewModel({this.context});

  Future fetchData() async {
    await fetchCartData();
    QuerySnapshot productSnapShot = await fetchProductsData();
    return productSnapShot;
  }

  Future fetchCartData() async {
     DocumentSnapshot snapshot = await _productsRetriever.retrieveCartModels();
    if (snapshot.exists) {
      getUserCartData(snapshot);
    }
  }

  Future<QuerySnapshot> fetchProductsData() async {
       QuerySnapshot productSnapShot =
        await _productsRetriever.retrieveAllProducts();
    getAllProductsFromSnapshot(productSnapShot);
    return productSnapShot;
  }

  void getUserCartData(DocumentSnapshot snapShot) {
    var cartData = List.from(snapShot.data()[CART_ITEMS]);
    cartModels =
        cartData.map((cartItem) => CartModel.fromJson(cartItem)).toList();
    Provider.of<CartFavoriteProvider>(context, listen: false)
        .setCartProducts(cartModels);
  }

  void getAllProductsFromSnapshot(QuerySnapshot snapShot) {
    snapShot.docs.forEach((doc) {
      Product product = ProductFactory(snapShot: doc.data()).getProduct();
      product.mainInfo.id = doc.id;
      //_checkIfProductInCart(product);
      products.add(product);
    });
   // Provider.of<ProductProvider>(context,listen: false).setAllProducts(products);
  }

  void _checkIfProductInCart(NewProductModel product) {
    for (int i = 0; i < cartModels.length; i++) {
      if (cartModels[i].productId == product.id) {
        cartModels[i].product = product;
        product.inCart = true;
        break;
      }
    }
  }

  void navigateToHomeScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
}
