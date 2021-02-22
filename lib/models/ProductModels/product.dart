



import 'package:flutter/material.dart';
import 'package:online_shopping_store/models/ProductModels/product_main_info.dart';

abstract class Product {
 ProductMainInfo mainInfo;
 Product({@required this.mainInfo});
 Widget buildProductSpecs(BuildContext context);
 Map<String,dynamic>toMap();

}