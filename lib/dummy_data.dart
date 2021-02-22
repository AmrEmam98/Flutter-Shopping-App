import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping_store/constants.dart';
import 'package:online_shopping_store/models/ProductModels/cloth_product.dart';
import 'package:online_shopping_store/models/color_map.dart';
import 'models/ProductModels/mobile_product.dart';
import 'models/category.dart';
import 'models/ProductModels/product.dart';
import 'models/color_map.dart';
import 'models/ProductModels/product_main_info.dart';

class DummyData {
  static fillCategoryDummyData() {
    List<Category> categories = List();
    categories.add(Category(catName: ALL_CAT, catIcon: Icons.menu));
    categories
        .add(Category(catName: CLOTHES_CAT, catIcon: FontAwesomeIcons.tshirt));
    categories.add(Category(catName: MOBILE_CAT, catIcon: Icons.phone_android));
    categories.add(Category(catName: 'Home', catIcon: FontAwesomeIcons.chair));
    categories
        .add(Category(catName: 'Baby', catIcon: FontAwesomeIcons.babyCarriage));
    categories.add(
        Category(catName: 'Fashion', catIcon: FontAwesomeIcons.shoppingBag));
    return categories;
  }

  static List<String> getCarouselImageList() {
    List<String> imgList = [
      'https://images.unsplash.com/photo-1534452203293-494d7ddbf7e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1513884923967-4b182ef167ab?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'https://images.unsplash.com/photo-1513885535751-8b9238bd345a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'https://images.unsplash.com/photo-1487412912498-0447578fcca8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'https://images.unsplash.com/photo-1526178613552-2b45c6c302f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
      'https://images.unsplash.com/photo-1472417583565-62e7bdeda490?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    ];
    return imgList;
  }

  static List<Product> fillProductDummyData() {
    List<Product> products = List();
    ProductMainInfo dummyMobileProductMainInfo = ProductMainInfo(
      quantityInStock: 20,
      categoryType: MOBILE_CAT,
      model: 'Apple',
      title: 'iPhone 11',
      displayedImageColor: ColorMap(
        imgColorUrl:
        'https://cf1.s3.souqcdn.com/item/2019/09/12/68/31/29/56/item_XL_68312956_52f2e72256740.jpg',
        colorLabel: 'Green',
      ),
      description:
          'Experience the next-generation technology in the Apple iPhone 11 that features the A13 Bionic chip with the brilliant Neural Engine,',
      price: 12999.00,
      rate: 5,
      inCart: false,
      isFavourite: false,
    );
    Product dummyMobileProduct = MobileProduct(
        capacity: '256 GB',
        fCamera: 8,
        bCamera: 24,
        mainInfo: dummyMobileProductMainInfo,
        ramSize: '16 GB');

    products.add(dummyMobileProduct);

    ProductMainInfo dummyMobileProductMainInfo2 = ProductMainInfo(
      quantityInStock: 10,
      categoryType: MOBILE_CAT,
      model: 'Apple',
      title: 'iPhone 11',
      displayedImageColor: ColorMap(
          imgColorUrl:
          'https://www.techinn.com/f/13735/137354156/apple-iphone-11-128gb-6.1.jpg',
          colorLabel: 'Black'),
      description:
          'Experience the next-generation technology in the Apple iPhone 11 that features the A13 Bionic chip with the brilliant Neural Engine,',
      price: 12999.00,
      rate: 5,
      inCart: false,
      isFavourite: false,
    );

    Product dummyMobileProduct2 = MobileProduct(
        capacity: '128 GB',
        fCamera: 8,
        bCamera: 24,
        mainInfo: dummyMobileProductMainInfo2,
        ramSize: '8 GB');
    products.add(dummyMobileProduct2);

    ProductMainInfo dummyMobileProductMainInfo3 = ProductMainInfo(
      quantityInStock: 30,
      categoryType: MOBILE_CAT,
      model: 'Apple',
      title: 'iPhone 11',
      displayedImageColor:ColorMap(
          imgColorUrl:
          'https://cf2.s3.souqcdn.com/item/2019/09/12/68/31/29/57/item_XL_68312957_a5a9cd6f62c4a.jpg',
          colorLabel: 'White'),
      description:
          'Experience the next-generation technology in the Apple iPhone 11 that features the A13 Bionic chip with the brilliant Neural Engine,',
      price: 12999.00,
      rate: 5,
      inCart: false,
      isFavourite: false,
    );

    Product dummyMobileProduct3 = MobileProduct(
        capacity: '128 GB',
        fCamera: 8,
        bCamera: 24,
        mainInfo: dummyMobileProductMainInfo3,
        ramSize: '8 GB');
    products.add(dummyMobileProduct3);

    ProductMainInfo dummyMobileProductMainInfo4 = ProductMainInfo(
      quantityInStock: 10,
      categoryType: MOBILE_CAT,
      model: 'Apple',
      title: 'iPhone 11',
      displayedImageColor:ColorMap(
          imgColorUrl:
          'https://cf1.s3.souqcdn.com/item/2019/09/12/68/31/29/48/item_XL_68312948_63bd51c18418a.jpg',
          colorLabel: 'Silver'),
      description:
          'Experience the next-generation technology in the Apple iPhone 11 that features the A13 Bionic chip with the brilliant Neural Engine,',
      price: 12999.00,
      rate: 5,
      inCart: false,
      isFavourite: false,
    );

    Product dummyMobileProduct4 = MobileProduct(
        capacity: '64 GB',
        fCamera: 8,
        bCamera: 24,
        mainInfo: dummyMobileProductMainInfo4,
        ramSize: '4 GB');
    products.add(dummyMobileProduct4);

    ColorMap tshirtColor = ColorMap(
        colorLabel: 'White',
        imgColorUrl:
            'https://cf1.s3.souqcdn.com/item/2019/08/24/67/48/20/41/item_XXL_67482041_58b44b5bb8ed7.jpg');

    ProductMainInfo dummyClothProuctMainInfo = ProductMainInfo(
      quantityInStock: 50,
      categoryType: CLOTHES_CAT,
      title: 'T-Shirts Polo V Neck',
      description: 'T-Shirts Polo V Neck Cotton Short Sleeve -White M',
      model: 'H & M',
      price: 290.0,
      rate: 4.0,
      displayedImageColor: tshirtColor,
    );

    Product dummyClothProduct =
        ClothProduct(mainInfo: dummyClothProuctMainInfo, size: 'M');
    products.add(dummyClothProduct);
    Product dummyClothProduct2 =
        ClothProduct(mainInfo: dummyClothProuctMainInfo, size: 'XL');
    products.add(dummyClothProduct2);

    return products;
  }
}
