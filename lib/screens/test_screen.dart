
import 'package:flutter/material.dart';
import 'package:online_shopping_store/FirebaseServices/product_retriever.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/ProductModels/product_factory.dart';


class TestScreen extends StatelessWidget {
  List<Product>products=List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:ProductsRetriever().retrieveAllProducts() ,
        builder: (context,snapShot){
          if(snapShot.connectionState==ConnectionState.done){
            snapShot.data.docs.forEach((doc){
            Product product=  ProductFactory(snapShot: doc.data()).getProduct();
            products.add(product);

            });
            return Center(child: Text('Finished'));

          }
          return Center(child: Text('Loading'));
        },
      ),
    );
  }
}
