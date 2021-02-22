import 'package:flutter/material.dart';
import 'package:online_shopping_store/ViewModels/category_view_model.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/category.dart';
import 'package:online_shopping_store/widgets/product_item.dart';

class CategoryScreen extends StatelessWidget {
  Category category;
  CategoryViewModel categoryViewModel = CategoryViewModel();

  CategoryScreen(this.category);

  List<Product> catProduct;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    catProduct = categoryViewModel.filterProduct(context, category.catName);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            category.catName,
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
