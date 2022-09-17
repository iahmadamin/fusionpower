import 'package:get/get.dart';

class ProductProvier extends GetConnect {
  Future<Response> getProducts() async =>
      await get("https://fusionpower.co.za/wp-json/wc/v3/products");
}
