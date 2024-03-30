import 'package:get/get.dart';
import 'package:tailorcraft/Classes/Product.dart';

class ProductController extends GetxController {
  var colorvisible = false.obs;
  var selectedSize = "S".obs;
  // Sample list of products
  var products = <Product>[
    Product(
      image: 'https://picsum.photos/id/237/200/300',
      title: 'Product 1',
      description: 'Description of Product 1',
      price: 10.0,
      rating: 4.5,
    ),
    Product(
      image: 'https://picsum.photos/id/237/200/300',
      title: 'Product 2',
      description: 'Description of Product 2',
      price: 20.0,
      rating: 3.8,
    ),
    // Add more products as needed
  ].obs; // Make the list observable using .obs

  void showColor() {
    colorvisible.value = !colorvisible.value;
  }

  // void setSize(String size) {
  //   selectedSize.value = size;
  // }
}
