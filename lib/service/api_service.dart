
import 'package:http/http.dart' as http;
import 'package:tragon_machine_test/model/product_model.dart';
import 'package:tragon_machine_test/service/api_links.dart';
class ApiService{


   Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(productsUrl));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Failed to fetch products. Please try again.");
    }
  }

}