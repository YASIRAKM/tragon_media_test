import 'package:get/get.dart';
import 'package:tragon_machine_test/model/product_model.dart';
import 'package:tragon_machine_test/service/api_service.dart';

class ProductViewModel extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;
  var productList = <ProductModel>[].obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

 
  void fetchProducts() async {
    try {
      isLoading(true);
      isError(false);
      var products = await apiService.fetchProducts();
      productList.assignAll(products);
    } catch (e) {
      isError(true);
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }


  void retryFetch() {
    fetchProducts();
  }
}
