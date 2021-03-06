import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_store/provider/cart_favorite_provider.dart';
import 'package:online_shopping_store/provider/product_provider.dart';
import 'package:online_shopping_store/screens/home_screen.dart';
import 'package:online_shopping_store/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider<CartFavoriteProvider>(
            create: (context) => CartFavoriteProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFFAFAFA),
          fontFamily: 'Montserrat',
          primaryColor: Color(0xFFF93963),
          accentColor: Colors.cyan[600],
          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700),
            headline5: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w500),
            headline4: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            headline3: TextStyle(color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
