import 'package:fusionpower/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  var currentStep = 1;

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
      update();
    }
  }

  void removeItem(Product product) {
    if (cart.length > 1) {
      cart.remove(product);
      update();
    }
  }
}
