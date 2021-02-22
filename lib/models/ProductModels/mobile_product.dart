import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/ProductModels/product_main_info.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_store/widgets/selectable_list_widget.dart';

class MobileProduct extends Product {
  int fCamera, bCamera;
  String ramSize;
  String capacity;

  MobileProduct(
      {@required this.capacity,
      @required this.bCamera,
      @required this.fCamera,
      @required this.ramSize,
      ProductMainInfo mainInfo})
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
          title: 'Ram:',
          selectableList: [ramSize],

        ),
        SizedBox(
          height: 16.0,
        ),
        SelectableListWidget(
          title: 'Capacity:',
          selectableList: [capacity],
        )
      ],
    );
  }

  MobileProduct.fromJson(dynamic snapShot)
      : super(mainInfo: ProductMainInfo.fromJson(snapShot['mainInfo'])) {
    bCamera = snapShot['bCamera'];
    fCamera = snapShot['fCamera'];
    ramSize = snapShot['ramSize'];
    capacity =snapShot['capacity'];
  }

  @override
  Map<String, dynamic> toMap() => {
        'mainInfo': mainInfo.toMap(),
        'fCamera': fCamera,
        'bCamera': bCamera,
        'ramSize': ramSize,
        'capacity': capacity,
      };
}
