import 'package:flutter/cupertino.dart';
import 'package:online_shopping_store/models/new_product_model.dart';
import 'package:online_shopping_store/provider/product_provider.dart';
import 'package:provider/provider.dart';


class CategoryViewModel {

  List<NewProductModel> filterProduct(BuildContext context, CategoryType type) {
    List<NewProductModel>allProducts = Provider
        .of<ProductProvider>(context)
        .allProducts;

    if (isAllCategory(type)) {
      return allProducts;
    }
    return allProducts.where((element) => element.catType==type).toList();
  }

  bool isAllCategory(CategoryType type) => type == CategoryType.All;

}