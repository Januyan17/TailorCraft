// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailorcraft/Screens/Authentication/SignUp.dart';
import 'package:tailorcraft/Screens/BottomNavigation/BottomNavigation.dart';
import 'package:tailorcraft/SharedPreferences/sharedPreference.dart';

import '../../API/api.dart';
import '../../ReusableWidgets/AuthReusable/AuthReusable.dart';
import '../../ReusableWidgets/AuthReusable/Button.dart';
import '../../ReusableWidgets/FontStyle.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void signInUser() async {
    final token = SharedPreferences.getInstance();

    setState(() {
      isLoading = true;
    });
    try {
      var data = {
        "email": emailController.text,
        "password": passwordController.text,
      };

      print(" sending dataaaa");
      print(data);
      print(" sending dataaaa");
      var res = await CallApi().postData(data, 'api/login');
      var body = json.decode(res.body);

      setState(() {
        isLoading = false;
      });
      Get.snackbar("Success", "Successfully Login");
      print("token>>>>>>>>>>>>>>...");

      print(body['token']);
      MySharedPreferences.instance.setStringValue("token", body['token']);
      MySharedPreferences.instance.setStringValue("userId", body['_id']);

      Get.to(BottomNavigationScreen());
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SignIn",
                style: authHeading,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                height: screenHeight * 0.3,
                width: screenWidth,
                child: Image.asset("assets/images/test.png"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        prefixIcon: Icons.email,
                        obscure: false,
                        controller: emailController,
                        labelText: 'Email address',
                        validator: (value) => value!.isEmpty
                            ? "Email address can't be empty"
                            : null,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextFormField(
                        prefixIcon: Icons.password,
                        obscure: true,
                        controller: passwordController,
                        labelText: 'Password',
                        validator: (value) =>
                            value!.isEmpty ? "Password can't be empty" : null,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text("Forget Password?")),
                      SizedBox(height: screenHeight * 0.05),
                      isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                              value: 10,
                            ))
                          : CustomElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  signInUser();
                                }
                              },
                              label: 'SignIn',
                            ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Don't Have an Account"),
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(SignUpScreen());
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
