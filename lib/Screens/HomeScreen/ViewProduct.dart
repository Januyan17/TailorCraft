import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailorcraft/API/api.dart';
import 'package:tailorcraft/ReusableWidgets/AuthReusable/Button.dart';
import 'package:tailorcraft/Screens/HomeScreen/AddtoCart.dart';
import 'package:tailorcraft/Screens/Payment/Payment.dart';
import 'package:tailorcraft/Screens/Ratings/Ratings.dart';
import '../../Classes/Product.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import '../../GetXControllers/ProductController.dart';
import '../../GetXControllers/CartController.dart'; // Import CartController

class ViewProduct extends StatefulWidget {
  final String image;
  final String title;
  ViewProduct({Key? key, required this.image, required this.title});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  final ProductController productController = Get.find();
  final CartController cartController =
      Get.put(CartController()); // Initialize CartController

  var isLoading = false;
  var productColor;

  void AddData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getString('userId');
    print("UserIDDDDDDDDDDDDDDDDD");
    print(userId);

    setState(() {
      isLoading = true;
    });
    try {
      var data = {
        "title": widget.title,
        "size": productController.selectedSize.value,
        // "color": color,
        "price": "60",
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
      Get.to(PaymentScreen());

      print(body);
    } catch (e) {}
  }

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
                    widget.image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                widget.title.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Text(
                    "Price   : ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "100 £",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
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
                          // GetStorage box = GetStorage();
                          // box.write('color', color);
                          // Handle color changes
                        },
                        // selectedColor: Colors.red
                      )
                    : SizedBox(),
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // Get.to(AddtoCard());
                        Get.to(CommentListScreen());
                      },
                      child: Text("Ratings")),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.scanner),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // Add the product to the cart
                        var product = Product(
                          title: widget.title,
                          image: widget.image, description: 'hellooo',
                          price: 100,
                          rating: 4,
                          // Add other product details
                        );
                        cartController.addToCart(product);

                        // Navigate to the Cart List Page
                        Get.to(CartListPage());
                      },
                      child: Text("Add To Cart")),
                ],
              )),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        value: 10,
                      ),
                    )
                  : CustomElevatedButton(
                      onPressed: () {
                        AddData();
                      },
                      label: "Confirm")
            ],
          ),
        ),
      ),
    );
  }
}
