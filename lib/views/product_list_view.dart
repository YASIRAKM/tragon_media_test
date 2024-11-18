import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tragon_machine_test/model/product_model.dart';
import 'package:tragon_machine_test/utils/colors.dart';
import 'package:tragon_machine_test/utils/string.dart';
import 'package:tragon_machine_test/utils/text_styles.dart';
import 'package:tragon_machine_test/view_model/product_view_model.dart';
import 'package:tragon_machine_test/views/product_details_view.dart';
import 'package:tragon_machine_test/views/widgets/error_widget.dart';

class ProductListView extends StatelessWidget {
  ProductListView({super.key});

  final ProductViewModel productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          "Products",
          style: appBarTitleStyle(),
        ),
      ),
      body: bodyWidget(),
    );
  }

  Obx bodyWidget() {
    return Obx(() {
      if (productViewModel.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (productViewModel.isError.value) {
        return ErrorWidgetView(
            title: 'Failed to load products.',
            onPressed: () {
              productViewModel.retryFetch;
            });
      } else if (productViewModel.productList.isEmpty) {
        return const Center(child: Text('No products available'));
      } else {
        return Column(
          children: [
          const   SizedBox(height: 20,),
            Expanded(
              child: buildProductList(
                  'New Arrivals',
                  productViewModel.productList.sublist(
                      0, (productViewModel.productList.length * .5).toInt())),
            ),
            Expanded(
              child: buildProductList(
                'Trending Products',
                productViewModel.productList.sublist(
                    (productViewModel.productList.length * .5).toInt(),
                    productViewModel.productList.length),
              ),
            ),
       const     SizedBox(height: 20,),

          ],
        );
      }
    });
  }

  Widget buildProductList(String category, List<ProductModel> products) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category,
              style: titleStyle(),
            ),
          ),
        ),
        Expanded(flex: 6,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 6,
              );
            },
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final discountedPrice =
                  (product.price) - (product.price * (product.discount / 100));
          
              return productCard(product, discountedPrice);
            },
          ),
        ),
      ],
    );
  }

  GestureDetector productCard(ProductModel product, double discountedPrice) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductDetailPage(product: product),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 500),
        );
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: whiteColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: blackColor,
              ),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 130,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Text(
                      product.name,
                      style: titleStyleSmall(16),
                    ),
                  ),
                  Text(
                    'Brand: ${product.brand}',
                    style: productFadeText(12),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Price: \$ ${product.price.toStringAsFixed(2)}',
                    style: productPriceText(12),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Discounted: \$ ${discountedPrice.toStringAsFixed(2)}(${product.discount}%)',
                    style: productDiscoundText(12),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: yellowColor, size: 16),
                      Text(
                        product.rating.toString(),
                        style: normalText(),
                      ),
                      Text(
                        "(${product.reviews!.length})",
                        style: productFadeText(12),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
