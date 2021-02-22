import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/cart_model.dart';

import '../constants.dart';

class ProductSetter {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String uid= FirebaseAuth.instance.currentUser.uid;

  void addProduct(Product product) {
    _firebaseFirestore.collection(PRODUCTS_COLLECTION_PATH).add(product.toMap());
  }

  void updateCart(List<CartModel> newCart) {
    _firebaseFirestore.collection(CART_COLLECTION_PATH).doc(uid).set({CART_ITEMS:newCart.map((cartModel) => cartModel.toMap()).toList()});
  }
}
