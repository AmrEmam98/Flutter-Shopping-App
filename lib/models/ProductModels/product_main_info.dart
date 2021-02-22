import 'package:flutter/cupertino.dart';

import '../color_map.dart';

class ProductMainInfo {
  String title, description, model, id;
  double price, rate;
  bool isFavourite, inCart;
  ColorMap displayedImageColor;
  String categoryType;
  int quantityInStock;

  ProductMainInfo({
    @required this.title,
    @required this.description,
    @required this.model,
    @required this.price,
    @required this.categoryType,
    @required this.displayedImageColor,
    @required this.quantityInStock,
    this.rate = 0.0,
    this.id,
    this.isFavourite = false,
    this.inCart = false,
  });

  toMap() => {
        'title': title,
        'description': description,
        'model': model,
        'price': price,
        'categoryType': categoryType,
        'rate': rate,
        'isFavourite': isFavourite,
        'inCart': inCart,
        'displayedImageColor': displayedImageColor.toMap(),
        'quantityInStock': quantityInStock,
      };

  ProductMainInfo.fromJson(dynamic snapShot) {
    title = snapShot['title'];
    description = snapShot['description'];
    model = snapShot['model'];
    price = snapShot['price'];
    categoryType = snapShot['categoryType'];
    rate = snapShot['rate'];
    isFavourite = snapShot['isFavourite'];
    inCart = snapShot['inCart'];
    quantityInStock = snapShot['quantityInStock'];
    displayedImageColor = ColorMap.fromJason(snapShot['displayedImageColor']);
  }
}
