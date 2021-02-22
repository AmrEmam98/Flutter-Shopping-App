
import 'ProductModels/product.dart';

class CartModel {
  String productId;
  Product product;
  int orderedQuantity;
  CartModel({this.productId,this.product,this.orderedQuantity=1}){
    productId=product.mainInfo.id;
  }

  CartModel.fromJson(dynamic snapShot)
      :productId = snapShot['productId'],
      orderedQuantity = snapShot['orderedQuantity'];

  toMap() => {
        'productId': productId,
    'orderedQuantity':orderedQuantity
      };

  double getTotalPrice()=>orderedQuantity*product.mainInfo.price;
}
