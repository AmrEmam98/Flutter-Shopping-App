import 'package:flutter/widgets.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/new_product_model.dart';
class ProductProvider extends ChangeNotifier {
  List<NewProductModel> allProducts=List();

  void setAllProducts(List<NewProductModel> products) {
    this.allProducts = products;
  }

  void setAllProductsAndNoify(List<NewProductModel> products){
    this.allProducts = products;
    notifyListeners();
  }

  setProductCartValue(int index,bool value){
    allProducts[index].inCart=value;
    notifyListeners();
  }
}
