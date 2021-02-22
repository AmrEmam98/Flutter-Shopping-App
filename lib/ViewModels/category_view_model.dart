import 'package:flutter/cupertino.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CategoryViewModel {

  List<Product> filterProduct(BuildContext context, String category) {
    List<Product>allProducts = Provider
        .of<ProductProvider>(context)
        .allProducts;

    if (isAllCategory(category)) {
      return allProducts;
    }
    return allProducts.where((element) => element.mainInfo.categoryType==category).toList();
  }

  bool isAllCategory(String category) => category == ALL_CAT;

}