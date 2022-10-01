import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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

  Future<Response> emptyCart() async {
    return await post(
      "$base/wp-admin/admin-ajax.php?action=kcp_empty_cart_func",
      {},
    );
  }

  Future submitQuote(Map<String, dynamic> data) async {
    var response =
        await http.post(Uri.parse("$base/wp-admin/admin-ajax.php"), body: {
      "action": "submit_order",
      "cart_data": jsonEncode(data['cart_data']),
      "data": jsonEncode(data['user_data']),
      "shipping": jsonEncode(data['shipping'])
    });
    return response;
  }
}
