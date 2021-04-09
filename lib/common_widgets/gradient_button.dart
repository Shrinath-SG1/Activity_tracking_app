import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class CustomGradientButton extends StatelessWidget {
  final VoidCallback onPress;
final String text;
CustomGradientButton(this.text,this.onPress);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor("#381eea"),
            HexColor("#0584d5")
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      height: 50,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18)),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white
            ),
          )),
      margin: EdgeInsets.only(
          left: height * 0.04,
          right: height * 0.04,
          top: height * 0.03,
          bottom: height * 0.02),
    );
  }
}