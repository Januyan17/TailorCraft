// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tailorcraft/Screens/HomeScreen/ViewProduct.dart';
import '../../Colors/Colors.dart';
import '../../GetXControllers/ProductController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController searchController = TextEditingController();
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    final product = productController.products[index];
                    return Container(
                      height: screenHeight * 0.4,
                      width: screenWidth,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ViewProduct(
                              product: productController.products[index]));
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
                                Image.network(
                                  product.image,
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
                                            product.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            product.price.toString(),
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
                                          Text(product.description),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.yellow),
                                              Text(
                                                product.rating.toString(),
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
