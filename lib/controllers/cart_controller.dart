import 'package:fusionpower/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  var currentStep = 1;
  int totalPrice = 0;
  int subTotalPrice = 0;
  int discount = 0;

  void resetcurrentStep() {
    currentStep = 1;
    update();
  }

  void incrementcurrentStep() {
    if (currentStep < 3) {
      currentStep++;
      update();
    }
  }

  void decrementcurrentStep() {
    if (currentStep > 0) {
      currentStep--;
      update();
    }
  }

  void addProduct(Product product) {
    if (cart.length < 9) {
      cart.add(product);
      calculateSubtotal();
      update();
    }
  }

  void removeItem(Product product) {
    if (cart.isNotEmpty) {
      cart.remove(product);
      calculateSubtotal();
      update();
    }
  }

  void calculateSubtotal() {
    subTotalPrice = 0;
    for (var element in cart) {
      subTotalPrice += element.price;
    }
    calculateTotal();
  }

  void calculateTotal() {
    totalPrice = subTotalPrice - discount;
  }
}
