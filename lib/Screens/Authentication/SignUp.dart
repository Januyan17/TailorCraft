// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tailorcraft/Screens/Authentication/SignIn.dart';

import '../../ReusableWidgets/AuthReusable/AuthReusable.dart';
import '../../ReusableWidgets/AuthReusable/Button.dart';
import '../../ReusableWidgets/FontStyle.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                child: Image.asset("assets/images/boy1.png"),
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
                      CustomElevatedButton(
                        onPressed: () {
                          //Validator
                          if (_formKey.currentState!.validate()) {
                            Get.snackbar("Success", "Successfully Created");
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
                              Get.to(SignInScreen());
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
