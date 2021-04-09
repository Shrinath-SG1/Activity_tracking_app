import 'package:activity_tracking/common/app_colors.dart';
import 'package:activity_tracking/common/app_strings.dart';
import 'package:activity_tracking/common_widgets/gradient_button.dart';
import 'package:activity_tracking/common_widgets/social_media_signup_button.dart';
import 'package:flutter/material.dart';
import 'custom_clipper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = true;

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
                      colors: [AppColors.primaryBlue,AppColors.secondaryBlue],
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
                              AppStrings.Login,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                            Text(
                              AppStrings.SignUp,
                              style: TextStyle(fontSize: 24),
                            ),
                          ]),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: AppStrings.EmailIdMobileNumber,
                            prefixIcon: Icon(Icons.account_circle)),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: AppStrings.Password,
                          prefixIcon: Icon(Icons.lock),
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
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            AppStrings.ForgotPassword,
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        )
                      ]),
                      CustomGradientButton(AppStrings.LoginButtonText),
                      SizedBox(
                        height: height * 0.02,
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