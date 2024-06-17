import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tailorcraft/Screens/Payment/Payment.dart';
import '../../GetXControllers/CartController.dart';

class CartListPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (cartController.cartItems.isEmpty) {
                return Center(
                  child: Text('No items in the cart'),
                );
              } else {
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    var product = cartController.cartItems[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10.0),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                            width: 70,
                            height: 70,
                          ),
                        ),
                        title: Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Add other product details here',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            cartController.removeFromCart(product);
                          },
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(PaymentScreen());
                // Add your onPressed code here!
              },
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                minimumSize:
                    Size(double.infinity, 50), // Make the button full-width
              ),
            ),
          ),
        ],
      ),
    );
  }
}
