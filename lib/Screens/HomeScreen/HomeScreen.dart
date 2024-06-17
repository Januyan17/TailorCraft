// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailorcraft/API/api.dart';
import 'package:tailorcraft/Screens/HomeScreen/AddtoCart.dart';
import 'package:tailorcraft/Screens/HomeScreen/ViewProduct.dart';
import '../../Colors/Colors.dart';
import '../../GetXControllers/ProductController.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final ProductController productController = Get.put(ProductController());
  var _isLoading = false;
  List apiBody = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var userId = localStorage.getInt('id');
    setState(() {
      _isLoading = true;
    });
    try {
      var res = await CallApi().getData('api/products');
      apiBody = await json.decode(res.body);
      print(apiBody);
    } catch (error) {}
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(CartListPage());
            },
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.memory(base64Decode("")),
              Container(
                width: screenWidth,
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: HexColor("#D9D9D9"),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: HexColor("#D9D9D9"),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.black),
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                height: screenHeight * 0.75,
                width: screenWidth,
                child: ListView.builder(
                  itemCount: apiBody.length,
                  itemBuilder: (context, index) {
                    // final product = productController.products[index];
                    return Container(
                      height: screenHeight * 0.4,
                      width: screenWidth,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ViewProduct(
                            image: apiBody[index]["imageUrl"],
                            title: apiBody[index]["title"],
                          ));
                        },
                        child: Card(
                          margin: EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0), // Border radius
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Column(
                              children: [
                                // Image.memory(
                                //     width: screenWidth,
                                //     height: screenHeight * 0.3,
                                //     fit: BoxFit.cover,
                                //     base64Decode(
                                //         apiBody[index]["courseImage"])),

                                Image.network(
                                  apiBody[index]['imageUrl'],
                                  width: screenWidth,
                                  height: screenHeight * 0.3,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            apiBody[index]["title"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            apiBody[index]['price'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.001,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(apiBody[index]["description"]),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.yellow),
                                              Text(
                                                5.toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   leading: Image.network(
                          //     product.image,
                          //     width: 80,
                          //     height: 80,
                          //     fit: BoxFit.cover,
                          //   ),
                          //   title: Text(product.title),
                          //   subtitle: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(product.description),
                          //       SizedBox(height: 4),
                          //       Text('\$${product.price.toString()}'),
                          //       SizedBox(height: 4),
                          //       Row(
                          //         children: [
                          //           Icon(Icons.star, color: Colors.yellow),
                          //           Text(product.rating.toString()),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          //   onTap: () {
                          //     // Handle tap event
                          //   },
                          // ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
