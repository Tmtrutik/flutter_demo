import 'package:flutter_demo/data/model/home/home_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxBool isCartEmpty = false.obs;
  RxList<HomeProductModel> cartProducts = <HomeProductModel>[].obs;
  @override
  void onInit() {
    super.onInit();

    final argProduct = Get.arguments?['products'];
    if (argProduct != null && argProduct is HomeProductModel) {
      final exists = cartProducts.any((item) => item.id == argProduct.id);
      if (!exists) {
        cartProducts.add(argProduct);
      }
    }
    updateCartEmptyState();
  }

  void updateCartEmptyState() {
    isCartEmpty.value = cartProducts.isEmpty;
  }

  ///add product to cart
  void addToCart(HomeProductModel product) {
    final existingIndex = cartProducts.indexWhere((item) => item.id == product.id);
    if (existingIndex != -1) {
      cartProducts[existingIndex].quantity = (cartProducts[existingIndex].quantity ?? 0) + 1;
    } else {
      product.quantity = 1;
      cartProducts.add(product);
    }
    cartProducts.refresh();
    updateCartEmptyState();
  }

  void clearCart() {
    cartProducts.clear();
    updateCartEmptyState();
  }

  void incrementQuantity(int index) {
    cartProducts[index].quantity = (cartProducts[index].quantity ?? 0) + 1;
    cartProducts.refresh();
  }

  void decrementQuantity(int index) {
    final currentQuantity = cartProducts[index].quantity ?? 1;
    if (currentQuantity > 1) {
      cartProducts[index].quantity = currentQuantity - 1;
      cartProducts.refresh();
    }
  }

  void removeItem(int index) {
    cartProducts.removeAt(index);
    updateCartEmptyState();
  }

  int get totalPrice => cartProducts.fold(
        0,
        (sum, product) {
          final price = int.tryParse(product.price ?? '0') ?? 0;
          final quantity = product.quantity ?? 1;
          return sum + (price * quantity);
        },
      );
  int get totalItems => cartProducts.fold(0, (sum, product) => sum + (product.quantity ?? 1));
}
