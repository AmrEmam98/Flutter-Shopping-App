import 'package:flutter/material.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/ProductModels/product_main_info.dart';
import 'package:online_shopping_store/widgets/selectable_list_widget.dart';

class ClothProduct extends Product {
  String size;

  ClothProduct({@required ProductMainInfo mainInfo, @required this.size})
      : super(mainInfo: mainInfo);

  @override
  Widget buildProductSpecs(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SelectableListWidget(
          title: 'Color:',
          selectableList: [mainInfo.displayedImageColor.colorLabel],
        ),
        SizedBox(
          height: 16.0,
        ),
        SelectableListWidget(
          title: 'Size:',
          selectableList: [size],
        ),
      ],
    );
  }

  ClothProduct.fromJson(dynamic snapShot)
      : super(mainInfo: ProductMainInfo.fromJson(snapShot['mainInfo'])) {
    size = snapShot['size'];
  }

  @override
  Map<String, dynamic> toMap() => {
        'mainInfo': mainInfo.toMap(),
        'size': size,
      };
}
