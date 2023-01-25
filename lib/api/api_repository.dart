import 'dart:convert';

import 'package:agumentik/model/dummy_model/product.dart';
import 'package:http/http.dart';

class Api {
  final String _url = 'https://dummyjson.com/products/';

  Future<List<Product>> fetchProductList() async {
    Response response = await get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List product = jsonDecode(response.body)['products'];
      print('dataaaaaaaaaaaaaaaaaaaaaa $product');
      return product.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
