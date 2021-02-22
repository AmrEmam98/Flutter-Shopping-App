import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_store/ViewModels/product_details_view_model.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/screens/cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  ProductDetailsScreen({this.product});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Product product;
  ProductDetailsViewModel _productDetailsViewModel;

  @override
  void initState() {
    product = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _productDetailsViewModel = ProductDetailsViewModel(context: context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.product.mainInfo.title,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        width: screenSize.width,
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.white,
                    width: screenSize.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CachedNetworkImage(
                            imageUrl: product
                                .mainInfo.displayedImageColor.imgColorUrl,
                            fit: BoxFit.fill,
                            height: screenSize.height * 0.35),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          product.mainInfo.title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Description:',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          product.mainInfo.description,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        product.buildProductSpecs(context),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${product.mainInfo.price} EGP',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
                            ),
                            AddToCartButton(
                              inCart: inCart(),
                              onTap: () {
                                inCart() ? removeFromCart() : addToCart();
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addToCart() {
    toggleCart();
    return _productDetailsViewModel.addProductToCart(product);
  }

  void removeFromCart() {
    toggleCart();
    return _productDetailsViewModel.removeProductFromCart(product);
  }

  void toggleCart() {
    setState(() {
      product.mainInfo.inCart = !product.mainInfo.inCart;
    });
  }

  bool inCart() => product.mainInfo.inCart;
}

class AddToCartButton extends StatelessWidget {
  final Function onTap;
  bool inCart;

  AddToCartButton({this.onTap, this.inCart});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              colors: [
                Colors.lightGreen,
                Colors.green,
              ],
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              inCart ? Icons.shopping_cart : Icons.add_shopping_cart,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              inCart ? 'Remove From Cart' : 'Add to Cart',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
