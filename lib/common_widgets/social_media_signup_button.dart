import 'package:flutter/material.dart';
class SocialMediaButton extends StatelessWidget {
  final String image;
  final String text;
  SocialMediaButton({this.image,this.text});
  @override
  Widget build(BuildContext context) {
    return                         Container(
      //margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
      child: new RaisedButton(
          padding: EdgeInsets.only(top: 3.0,bottom: 3.0,),
          color: Colors.white,
          onPressed: () {},
          child:  Row(
            children: <Widget>[
              SizedBox(width: 5,),
              Image.network(
                image,
                height: 30.0,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10.0,right: 10.0),
                  child:  Text(text,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
              ),
            ],
          )
      ),
    );
  }
}
