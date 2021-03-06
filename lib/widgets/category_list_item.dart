import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_store/models/category.dart';
import 'package:online_shopping_store/models/new_product_model.dart';
import 'package:online_shopping_store/screens/category_screen.dart';

class CategoryListItem extends StatelessWidget {
  final CategoryType catType;
  IconData catIcon;
  CategoryListItem({this.catType,this.catIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen(catType)));;
        },
        child: Column(
          children: <Widget>[
            Container(
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 1.0
                )

              ),
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
              catIcon,
              color: Colors.black,
              size: 32.0,
            ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
            ),
            Text(
              catType.toString().split('.')[1],
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
