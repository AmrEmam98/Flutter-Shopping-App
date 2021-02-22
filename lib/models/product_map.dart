

import 'dart:collection';

import 'package:online_shopping_store/models/ProductModels/product.dart';

class ProductMap{
  HashMap<String,Product> products=HashMap();
  ProductMap({this.products});

  ProductMap.fromProductsIdList(List<String> productsIdList){
    //TODO add Named Constructor
  }

  toMap()=> {
  'products':products.keys
};


}