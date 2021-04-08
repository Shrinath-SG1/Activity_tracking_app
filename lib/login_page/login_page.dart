import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible=true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
        //  color: Colors.teal,
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'Login  ',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,letterSpacing: 2),
                  ),
                  Text(
                    '/  Sign Up',
                    style: TextStyle(fontSize: 24),
                  ),
                ]),
                SizedBox(
                  height: height * 0.08,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email-Id / Mobile Number',
                      prefixIcon: Icon(Icons.account_circle)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  )
                ]),
                Container(
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
                      onPressed: () {},
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          color: Colors.white
                        ),
                      )),
                  margin: EdgeInsets.only(
                      left: height * 0.04,
                      right: height * 0.04,
                      top: height * 0.05,
                      bottom: height * 0.05),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
