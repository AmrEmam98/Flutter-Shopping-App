import 'package:online_shopping_store/models/new_product_model.dart';

import '../attributes_name.dart';


class TestNewProductsModel {
  List<NewProductModel> intializeProducts() {
    Map<String, dynamic> mobileSpecs = {
      kBCamera: 16.0,
      kFCamera: 5.0,
      kRamSize: 4.0,
      kCapacity: 64.0,
    };
    NewProductModel mobileProduct = NewProductModel(
        id: '1',
        model: 'Apple',
        title: 'iPhone 11',
        description:
        'Experience the next-generation technology in the Apple iPhone 11 that features the A13 Bionic chip with the brilliant Neural Engine,',
        imgUrl:
        'https://cf1.s3.souqcdn.com/item/2019/09/12/68/31/29/48/item_XL_68312948_63bd51c18418a.jpg',
        colorLabel: 'Silver',
        price: 12999.99,
        rate: 4.0,
        catType: CategoryType.Mobile,
        productSpecs: mobileSpecs);

    NewProductModel mobileProduct2 = NewProductModel(
        id: '2',
        model: 'Apple',
        title: 'iPhone 11',
        description:
        'Experience the next-generation technology in the Apple iPhone 11 that features the A13 Bionic chip with the brilliant Neural Engine,',
        imgUrl:
        'https://cf2.s3.souqcdn.com/item/2019/09/12/68/31/29/57/item_XL_68312957_a5a9cd6f62c4a.jpg',
        colorLabel: 'White',
        price: 12999.99,
        rate: 5.0,
        catType: CategoryType.Mobile,
        productSpecs: mobileSpecs);
    NewProductModel mobileProduct3 = NewProductModel(
        id: '3',
        model: 'Apple',
        title: 'iPhone 11',
        description:
        'Experience the next-generation technology in the Apple iPhone 11 that features the A13 Bionic chip with the brilliant Neural Engine,',
        imgUrl:
        'https://www.techinn.com/f/13735/137354156/apple-iphone-11-128gb-6.1.jpg',
        colorLabel: 'Black',
        price: 12999.99,
        rate: 5.0,
        catType: CategoryType.Mobile,
        productSpecs: mobileSpecs);

    List<NewProductModel> products = List();

    NewProductModel clothesProduct = NewProductModel(
        id: '4',
        catType: CategoryType.Clothes,
        title: 'T-Shirts Polo V Neck',
        description: 'T-Shirts Polo V Neck Cotton Short Sleeve -White M',
        model: 'H & M',
        price: 290.0,
        colorLabel: 'White',
        imgUrl:
        'https://cf1.s3.souqcdn.com/item/2019/08/24/67/48/20/41/item_XXL_67482041_58b44b5bb8ed7.jpg',
        rate: 4.0,
        productSpecs: {
          kTShirtSize: 'XXl',
        });

    products.add(mobileProduct);
    products.add(mobileProduct2);
    products.add(mobileProduct3);
    products.add(clothesProduct);
    return products;
  }
}
