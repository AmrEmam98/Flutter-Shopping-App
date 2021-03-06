import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_store/models/new_product_model.dart';
import 'package:online_shopping_store/models/cart_model.dart';
import 'package:online_shopping_store/provider/cart_favorite_provider.dart';
import 'package:online_shopping_store/provider/product_provider.dart';
import 'package:online_shopping_store/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final int cartItemIndex;

  CartItem({this.cartItemIndex});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Consumer<CartFavoriteProvider>(
        builder: (context, cartProvider, child) {
          CartModel cartModel = cartProvider.cartProducts[cartItemIndex];
          return Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: cartModel.product.imgUrl
                            ,
                        height: screenSize.height * 0.2,
                        width: screenSize.width * 0.3,
                        fit: BoxFit.contain,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenSize.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 24.0, left: 16.0),
                              child: Text(
                                cartModel.product.title,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline4,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 32.0,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              removeCartItem(context);
                            }),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Text(
                        '${cartModel.getTotalPrice()} EGP',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            IconWidget(
                              symbol: '-',
                              onTap: () {
                                cartProvider.decreaseCartItemQuantity(
                                    cartItemIndex);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
                              child: Text(
                                '${cartProvider.cartProducts[cartItemIndex]
                                    .orderedQuantity}',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            IconWidget(
                              symbol: '+',
                              onTap: () {
                                cartProvider.increaseCartItemQuantity(
                                    cartItemIndex);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailsScreen(product: cartProvider
                                          .cartProducts[cartItemIndex]
                                          .product,)));
                            },
                            child: Text(
                              'Show Details',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: Colors.blue),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }

    );
  }

  void removeCartItem(BuildContext context){
    setProductCartToFalse(context);
    Provider.of<CartFavoriteProvider>(context,listen: false).removeCartItemByIndex(cartItemIndex);
  }

  void setProductCartToFalse(BuildContext context) {
    NewProductModel product=Provider.of<CartFavoriteProvider>(context,listen: false).cartProducts[cartItemIndex].product;
    int productIndex=Provider.of<ProductProvider>(context,listen: false).allProducts.indexOf(product);
    Provider.of<ProductProvider>(context,listen: false).setProductCartValue(productIndex, false);

  }
}

class IconWidget extends StatelessWidget {
  String symbol;
  Function onTap;

  IconWidget({this.symbol, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 25.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: InkWell(
          onTap: onTap,
          child: Center(
              child: Text(
                symbol,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0),
              ))),
    );
  }
}
