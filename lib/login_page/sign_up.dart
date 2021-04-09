import 'package:activity_tracking/common/app_colors.dart';
import 'package:activity_tracking/common/app_strings.dart';
import 'package:activity_tracking/common_widgets/gradient_button.dart';
import 'package:activity_tracking/common_widgets/social_media_signup_button.dart';
import 'package:activity_tracking/home/home.dart';
import 'package:activity_tracking/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'custom_clipper.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _passwordVisible = true;
  final _formKey=GlobalKey<FormState>();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  String validateInput(String value){
      if (value.isEmpty) {
        return AppStrings.EnterSomething;
      }
      return null;

  }

  void _register() async {
    final FirebaseUser user = (await
    _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
    ).user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(overflow: Overflow.visible, children: [
          Container(
            child: Column(children: [
              ClipPath(
                clipper: CustomShapeClass(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  width: double.infinity,
                  height: 200.0,
                ),
              ),
              Container(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.SignUp1,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      child: LoginPage())),
                              child: Text(
                                AppStrings.Login1,
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Form(
                        key: _formKey,
                          child: Column(
                        children: [
                          TextFormField(
                           // validator: validateInput,
                            decoration: InputDecoration(
                                labelText: AppStrings.EmailIdMobileNumber,
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                )),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextFormField(
                            controller: _emailController,
                            validator: validateInput,
                            decoration: InputDecoration(
                                labelText: AppStrings.EmailId,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                )),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextFormField(
                           // validator: validateInput,
                            decoration: InputDecoration(
                                labelText: AppStrings.MobileNumber,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                )),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextFormField(
                            validator: validateInput,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: AppStrings.Password,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
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
                        ],
                      )),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            AppStrings.ForgotPassword,
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        )
                      ]),
                      CustomGradientButton(
                        AppStrings.LoginButtonText,
                        () {
                          if(_formKey.currentState.validate()){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => HomeScreen()),
                            // );
                            _register();
                          }
                        },
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(_success == null
                            ? ''
                            : (_success
                            ? 'Successfully registered ' + _userEmail
                            : 'Registration failed')),
                      ),
                      Text(AppStrings.OR),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialMediaButton(
                            image: AppStrings.FaceBookImg,
                            text: AppStrings.FaceBook,
                          ),
                          SocialMediaButton(
                            image: AppStrings.GoogleImg,
                            text: AppStrings.Google,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
