// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tailorcraft/ReusableWidgets/AuthReusable/Button.dart';
import 'package:tailorcraft/Screens/Ratings/Ratings.dart';

import '../../Classes/Product.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../../GetXControllers/ProductController.dart';

class ViewProduct extends StatelessWidget {
  final Product product;
  ViewProduct({Key? key, required this.product});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.3,
                width: screenWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                product.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              Text(
                "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      productController.showColor();
                    },
                    child: Text(
                      "Show Color",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Obx(
                    () => productController.colorvisible.value
                        ? Icon(Icons.tungsten_rounded)
                        : SizedBox(),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Obx(
                () => productController.colorvisible.value
                    ? MaterialColorPicker(
                        onColorChange: (Color color) {
                          print(color);
                          // Handle color changes
                        },
                        // selectedColor: Colors.red
                      )
                    : SizedBox(),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Select Size:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Obx(() => Row(
                    children: [
                      Radio<String>(
                        value: 'S',
                        groupValue: productController.selectedSize.value,
                        onChanged: (value) {
                          productController.selectedSize.value = value!;
                        },
                      ),
                      Text('S'),
                      Radio<String>(
                        value: 'M',
                        groupValue: productController.selectedSize.value,
                        onChanged: (value) {
                          productController.selectedSize.value = value!;
                        },
                      ),
                      Text('M'),
                      Radio<String>(
                        value: 'L',
                        groupValue: productController.selectedSize.value,
                        onChanged: (value) {
                          productController.selectedSize.value = value!;
                        },
                      ),
                      Text('L'),
                      Radio<String>(
                        value: 'XL',
                        groupValue: productController.selectedSize.value,
                        onChanged: (value) {
                          productController.selectedSize.value = value!;
                        },
                      ),
                      Text('XL'),
                      Radio<String>(
                        value: 'XXL',
                        groupValue: productController.selectedSize.value,
                        onChanged: (value) {
                          productController.selectedSize.value = value!;
                        },
                      ),
                      Text('XXL'),
                    ],
                  )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(CommentListScreen());
                      },
                      child: Text("Ratings"))),
              // CustomElevatedButton(onPressed: () {}, label: "Ratings"),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              CustomElevatedButton(onPressed: () {}, label: "Confirm Booking")
            ],
          ),
        ),
      ),
    );
  }
}
