// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tailorcraft/Screens/Authentication/SignIn.dart';

import '../../API/api.dart';
import '../../ReusableWidgets/AuthReusable/AuthReusable.dart';
import '../../ReusableWidgets/AuthReusable/Button.dart';
import '../../ReusableWidgets/FontStyle.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var isLoading = false;

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      var data = {
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };

      print(" sending dataaaa");
      print(data);
      print(" sending dataaaa");
      var res = await CallApi().postData(data, 'api/register');
      var body = json.decode(res.body);
      setState(() {
        isLoading = false;
      });
      Get.snackbar("Success", "Successfully Created");
      Get.to(SignInScreen());

      print(body);
    } catch (e) {}
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
                "SignUp",
                style: authHeading,
              ),
              SizedBox(
                height: screenHeight * 0.03,
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
                        prefixIcon: Icons.person,
                        obscure: false,
                        controller: usernameController,
                        labelText: 'User Name',
                        validator: (value) => value!.isEmpty
                            ? "User Name address can't be empty"
                            : null,
                      ),
                      SizedBox(height: screenHeight * 0.02),
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
                      SizedBox(height: screenHeight * 0.05),
                      isLoading
                          ? Center(
                              child: CircularProgressIndicator.adaptive(
                                value: 10,
                              ),
                            )
                          : CustomElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              },
                              label: 'SignUp',
                            ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Already Have an Account"),
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              signUpUser();
                            },
                            child: Text(
                              "SignIn",
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
