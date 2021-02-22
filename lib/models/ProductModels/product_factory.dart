import 'package:online_shopping_store/constants.dart';
import 'package:online_shopping_store/models/ProductModels/cloth_product.dart';
import 'package:online_shopping_store/models/ProductModels/mobile_product.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';

class ProductFactory {
  dynamic snapShot;

  ProductFactory({this.snapShot});

  String _getProductType() {
    var catType = snapShot['mainInfo']['categoryType'];
    return catType;
  }

  Product getProduct() {
    switch (_getProductType()) {
      case MOBILE_CAT:
        return MobileProduct.fromJson(snapShot);
      case CLOTHES_CAT:
        return ClothProduct.fromJson(snapShot);
    }
    return null;
  }
}
