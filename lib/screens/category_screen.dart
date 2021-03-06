import 'package:flutter/material.dart';
import 'package:online_shopping_store/ViewModels/category_view_model.dart';
import 'package:online_shopping_store/models/new_product_model.dart';
import 'package:online_shopping_store/widgets/product_item.dart';

class CategoryScreen extends StatelessWidget {
  CategoryType productType;
  CategoryViewModel categoryViewModel = CategoryViewModel();

  CategoryScreen(this.productType);

  List<NewProductModel> catProduct;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    catProduct = categoryViewModel.filterProduct(context, productType);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            productType.toString().split('.')[0],
            style: Theme.of(context).textTheme.headline3,
          ),
          centerTitle: true,
        ),
        body: Container(
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (screenSize.width / 2) /
                  (screenSize.height / (screenSize.height > 700 ? 2.5 : 2.2)),
              crossAxisCount: 2),
          itemBuilder: (context, i) => ProductItem(index: i,),
          itemCount: catProduct.length,
        )));
  }


}
