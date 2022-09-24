import 'package:get/get.dart';

class ProductProvier extends GetConnect {
  Future<Response> getKits() async =>
      await get("https://fusionpower.co.za/wp-json/wc/v3/products");

  Future<Response> getProductById(int id) async =>
      await get("https://fusionpower.co.za/wp-json/wc/v3/products/$id");
}
