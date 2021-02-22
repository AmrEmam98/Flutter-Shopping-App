import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  const RoundedButton({
    @required this.screenSize,
    @required this.text,
    @required this.onPressed,
  }) ;

  final Size screenSize;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        width: screenSize.width,
        height: 60.0,
        child: FlatButton(
          color:Theme.of(context).primaryColor,

          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Text(
            text??"Null",
            style: TextStyle(
                color:Colors.white,
                fontSize: 20.0
            ),
          ),
        ),
      ),
    );
  }
}
