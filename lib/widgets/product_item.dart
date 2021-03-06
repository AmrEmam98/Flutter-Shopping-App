import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/cart_model.dart';
import 'package:online_shopping_store/provider/cart_favorite_provider.dart';
import 'package:online_shopping_store/provider/product_provider.dart';
import 'package:online_shopping_store/screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:online_shopping_store/models/new_product_model.dart';

class ProductItem extends StatelessWidget {
  NewProductModel product;
  final int maxStringLength = 13;
  int index;

  ProductItem({this.index});

  @override
  Widget build(BuildContext context) {
    product = Provider.of<ProductProvider>(context).allProducts[index];
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
                  product: product,
                )));
      },
      child: Card(
        elevation: 5.0,
        child: Container(
          width: screenSize.width * 0.42,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: product.imgUrl,
                height: screenSize.height * 0.2,
                width: screenSize.width * 0.25,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                resizeString(product.model),
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                child: Text(
                  resizeString(product.title),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                '${product.price} EGP',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              RatingBar.readOnly(
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                initialRating: product.rate,
                filledColor: Colors.amber,
                size: 22.0,
              ),
              FavouriteCartRow(index: index)
            ],
          ),
        ),
      ),
    );
  }

  String resizeString(String title) {
    if (title.length > maxStringLength)
      return product.title.substring(0, maxStringLength) + '..';
    return title;
  }
}

class FavouriteCartRow extends StatelessWidget {
  int index;

  FavouriteCartRow({this.index});

  NewProductModel product;

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartFavoriteProvider, ProductProvider>(
        builder: (context, cartFavoriteProvider, productProvider, child) {
      product = productProvider.allProducts[index];
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                  product.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: product.isFavourite
                      ? Theme.of(context).primaryColor
                      : Colors.black),
              onPressed: () {
                product.isFavourite = product.isFavourite;
              },
            ),
            IconButton(
              icon: Icon(
                inCart() ? Icons.shopping_cart : Icons.add_shopping_cart,
                color: inCart() ? Theme.of(context).primaryColor : Colors.black,
              ),
              onPressed: () {
                inCart()
                    ? removeProductFromCart(
                        cartFavoriteProvider, productProvider)
                    : addProductToCart(cartFavoriteProvider, productProvider);
              },
            ),
          ],
        ),
      );
    });
  }

  void addProductToCart(CartFavoriteProvider cartFavoriteProvider,
      ProductProvider productProvider) {
    productProvider.setProductCartValue(index, true);
    cartFavoriteProvider.addProductToCart(CartModel(product: product));
  }

  void removeProductFromCart(CartFavoriteProvider cartFavoriteProvider,
      ProductProvider productProvider) {
    productProvider.setProductCartValue(index, false);
    cartFavoriteProvider.removeProductFromCart(product);
  }

  bool inCart() => product.inCart;
}
