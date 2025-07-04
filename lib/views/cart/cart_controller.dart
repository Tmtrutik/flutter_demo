import 'package:get/get.dart';

class CartController extends GetxController {
  final RxInt quantity = 1.obs;
  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[
    {
      'image': 'assets/images/productshoes1.jpg',
      'title': 'Nike Air Max',
      'unitPrice': 350,
      'price': 350,
      'rating': 4.1,
      'reviews': '36 Reviews',
      'quantity': 1,
    },
    {
      'image': 'assets/images/productshoes2.jpg',
      'title': 'Nike Sports',
      'unitPrice': 250,
      'price': 250,
      'rating': 4.2,
      'reviews': '56 Reviews',
      'quantity': 1,
    },
    {
      'image': 'assets/images/productshoes3.jpg',
      'title': 'Vans',
      'unitPrice': 300,
      'price': 300,
      'rating': 4.6,
      'reviews': '66 Reviews',
      'quantity': 1,
    },
  ].obs;

  void increment() {
    quantity.value++;

  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  void incrementQuantity(int index) {
    cartItems[index]['quantity'] = (cartItems[index]['quantity'] as int) + 1;
    cartItems.refresh();
  }

  void decrementQuantity(int index) {
    if ((cartItems[index]['quantity'] as int) > 1) {
      cartItems[index]['quantity'] = (cartItems[index]['quantity'] as int) - 1;
      cartItems.refresh();
    } 
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  int get totalPrice => cartItems.fold(0, (sum, item) => sum + (item['unitPrice'] as int) * (item['quantity'] as int));
}