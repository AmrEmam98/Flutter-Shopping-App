import 'package:flutter/widgets.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> allProducts=List();

  void setAllProducts(List<Product> products) {
    this.allProducts = products;
  }

  void setAllProductsAndNoify(List<Product> products){
    this.allProducts = products;
    notifyListeners();
  }

  setProductCartValue(int index,bool value){
    allProducts[index].mainInfo.inCart=value;
    notifyListeners();
  }
}
