import 'package:get/get.dart';

class APIService extends GetConnect {
  final String base = 'https://fusionpower.co.za';

  Future<Response> getKits() async => await get("$base/wp-json/wc/v3/products");

  Future<Response> getProductById(int id) async =>
      await get("$base/wp-json/wc/v3/products/$id");

  /// Quote Submission to API
  // url: getEnv + '/wp-admin/admin-ajax.php',
  //           data: {
  //               action: "kcp_empty_cart_func"
  //           },

  // Future<Response> emptyCart() async => await post();

  Future<Response> submitQuote(Map<String, dynamic> data) async {
    return await post(
      "$base/wp-admin/admin-ajax.php",
      {
        "action": "submit_order",
        "cart_data": data['cart_data'],
        "user_data": data['user_data'],
      },
    );
  }
}
