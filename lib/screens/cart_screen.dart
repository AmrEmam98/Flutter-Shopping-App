import 'package:flutter/material.dart';
import 'package:online_shopping_store/provider/cart_favorite_provider.dart';
import 'package:online_shopping_store/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double SUB_TOTAL_CONTAINER_HEIGHT = screenSize.height * 0.2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: Consumer<CartFavoriteProvider>(
          builder: (context, cartProvider, child) {
          if(cartProvider.cartProducts.isEmpty){
           return nothingWidget(context);
          }
        return Column(
          children: [
            Container(
              height: screenSize.height - (SUB_TOTAL_CONTAINER_HEIGHT + 20),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                itemBuilder: (context, i) => Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                    child: CartItem(cartItemIndex: i)),
                itemCount: cartProvider.cartProducts.length,
              ),
            ),
            Expanded(
              child: Card(
                elevation: 5.0,
                child: Container(
                  color: Colors.greenAccent[100],
                  width: screenSize.width,
                  height: SUB_TOTAL_CONTAINER_HEIGHT,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Sup Total :  ${cartProvider.getCartTotalPrice()} EGP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: screenSize.width,
                          child: RaisedButton(
                            color: Colors.green,
                            onPressed: () {},
                            child: Text('Check Out',style: Theme.of(context).textTheme.headline3,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
  Widget nothingWidget(BuildContext context){
    return Center(child: Text('Nothing To Show',style:Theme.of(context).textTheme.headline5));
  }
}
