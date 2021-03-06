
import 'ProductModels/product.dart';
import 'new_product_model.dart';

class CartModel {
  String productId;
  NewProductModel product;
  int orderedQuantity;
  CartModel({this.productId,this.product,this.orderedQuantity=1}){
    productId=product.id;
  }

  CartModel.fromJson(dynamic snapShot)
      :productId = snapShot['productId'],
      orderedQuantity = snapShot['orderedQuantity'];

  toMap() => {
        'productId': productId,
    'orderedQuantity':orderedQuantity
      };

  double getTotalPrice()=>orderedQuantity*product.price;
}
