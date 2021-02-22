import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:online_shopping_store/FirebaseServices/product_retriever.dart';
import 'package:online_shopping_store/ViewModels/home_view_model.dart';
import 'package:online_shopping_store/models/ProductModels/product.dart';
import 'package:online_shopping_store/models/category.dart';
import 'package:online_shopping_store/provider/product_provider.dart';
import 'package:online_shopping_store/screens/cart_screen.dart';
import 'package:online_shopping_store/widgets/category_list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:online_shopping_store/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';

class HomeScreen extends StatelessWidget {
  HomeViewModel homeViewModel;

  List<Product> products;

  @override
  Widget build(BuildContext context) {
    homeViewModel=HomeViewModel(context: context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home', style: Theme.of(context).textTheme.headline3),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 28.0,
            ),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 28.0,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
                },
              ),
              Visibility(
                visible: homeViewModel.getCartCount()!=0,
                child: Positioned(
                  top: 1,
                  right: 1,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 10.0,
                    child: Text(
                      ('${homeViewModel.getCartCount()}'),
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Text('Drawer Item'),
            Text('Drawer Item'),
          ],
        ),
      ),
      body: HomeBody()

    );
  }
}

class HomeBody extends StatelessWidget {
  List<Category> categories = DummyData.fillCategoryDummyData();
  List<Product> trendingProducts;
  List<Product> bestSelling = DummyData.fillProductDummyData();

  @override
  Widget build(BuildContext context) {
    trendingProducts = Provider.of<ProductProvider>(context).allProducts;
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 8.0),
            height: 120.0,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  CategoryListItem(categories[index]),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            width: screenSize.width * 0.9,
            child: CarouselSlider(
              options: CarouselOptions(
                height: screenSize.height * 0.3,
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: true,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: DummyData.getCarouselImageList()
                  .map((imgUrl) => CachedNetworkImage(
                        imageUrl: imgUrl,
                        placeholder: (context, url) => Text('Loading'),
                        fit: BoxFit.cover,
                        width: screenSize.width * 0.8,
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          _TitleTextWidget(
            title: 'Popular Trendings',
            onTap: () {},
          ),
          _buildHoriznotalProductView(screenSize, trendingProducts),
          _TitleTextWidget(
            title: 'Best Selling',
            onTap: () {},
          ),
          _buildHoriznotalProductView(screenSize, bestSelling),
        ],
      ),
    );
  }
}

class _TitleTextWidget extends StatelessWidget {
  final String title;
  final Function onTap;

  _TitleTextWidget({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style:
                Theme.of(context).textTheme.headline6.copyWith(fontSize: 22.0),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              'View all',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

Container _buildHoriznotalProductView(Size screenSize, List<Product> prodcuts) {
  return Container(
    height: screenSize.height > 700
        ? screenSize.height * 0.41
        : screenSize.height * 0.44,
    child: ListView.builder(
      itemBuilder: (context, index) => ProductItem(index: index,),
      itemCount: prodcuts.length,
      scrollDirection: Axis.horizontal,
    ),
  );
}
