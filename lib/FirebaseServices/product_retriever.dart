import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_shopping_store/constants.dart';

class ProductsRetriever {
  var firebaseFirestoreInstance = FirebaseFirestore.instance;
  String userId=FirebaseAuth.instance.currentUser.uid;
  Future retrieveAllProducts() {
    return firebaseFirestoreInstance.collection(PRODUCTS_COLLECTION_PATH).get();
  }

  Future retrieveCartModels() {
    return firebaseFirestoreInstance.collection(CART_COLLECTION_PATH).doc(userId).get();
  }
}

