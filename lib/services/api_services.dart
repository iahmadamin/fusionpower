import 'package:get/get.dart';

class ProductProvier extends GetConnect {
  Future<Response> getProducts() =>
      get("https://fusionpower.co.za/wp-json/wc/v3/products");
}
