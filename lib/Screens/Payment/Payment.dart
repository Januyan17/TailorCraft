// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tailorcraft/API/api.dart';
import 'package:tailorcraft/Screens/BottomNavigation/BottomNavigation.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController cardnumber = TextEditingController();
  final TextEditingController expiry = TextEditingController();
  final TextEditingController holdername = TextEditingController();
  final TextEditingController cvc = TextEditingController();

  var isLoading = false;
  var cardType;
  void AddData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var data = {
        "cardNo": cardnumber.text,
        "monthYear": expiry.text,
        // "color": color,
        "backNo": cvc.text,
        "cardType": cardType.toString(),
        "ownerName": holdername.text,
      };

      print(" sending dataaaa");
      print(data);
      print(" sending dataaaa");
      var res = await CallApi().postData(data, 'api/post');
      var body = json.decode(res.body);
      setState(() {
        isLoading = false;
      });
      Get.snackbar("Success", "Successfully added");
      Get.to(BottomNavigationScreen());

      print(body);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/debit.png', // Provide the path to your image
              height: 200,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: holdername,
              decoration: InputDecoration(
                labelText: 'Cardholder Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: cardnumber,
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Card Type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    value: 'Visa', // Default value
                    onChanged: (value) {
                      setState(() {
                        cardType == value;
                      });
                    },
                    items: <String>['Visa', 'MasterCard']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: expiry,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: cvc,
                    decoration: InputDecoration(
                      labelText: 'CVC',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    value: 10,
                  ))
                : ElevatedButton(
                    onPressed: () {
                      AddData();
                    },
                    child: Text('Pay Now'),
                  ),
          ],
        ),
      ),
    );
  }
}
