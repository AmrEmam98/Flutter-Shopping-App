import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:online_shopping_store/FirebaseServices/product_retriever.dart';
import 'package:online_shopping_store/ViewModels/loading_view_model.dart';
import 'package:online_shopping_store/constants.dart';
import 'package:online_shopping_store/screens/home_screen.dart';

class LoadingScreen extends StatelessWidget {
  final ProductsRetriever productsRetriever = ProductsRetriever();
  LoadingViewModel _loadingViewModel;

  @override
  Widget build(BuildContext context) {
    _loadingViewModel = LoadingViewModel(context: context);
    return Scaffold(
      body: FutureBuilder(
        future: _loadingViewModel.fetchData(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            _loadingViewModel.navigateToHomeScreen();

          }

          return Center(
            child: SpinKitDoubleBounce(
              color: Theme.of(context).primaryColor,
              size: 60.0,
            ),
          );
        },
      ),
    );
  }


}
