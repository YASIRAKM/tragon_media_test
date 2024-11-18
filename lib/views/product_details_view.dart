import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tragon_machine_test/model/product_model.dart';
import 'package:tragon_machine_test/utils/colors.dart';
import 'package:tragon_machine_test/utils/string.dart';
import 'package:tragon_machine_test/utils/text_styles.dart';
import 'package:tragon_machine_test/views/widgets/custom_button.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
      
      ),
      body: body(),
    );
  }

  SingleChildScrollView body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl:
                    imageUrl,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: blackColor),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                     
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            Text(
              product.name,
              style: appBarTitleStyle(),
            ),
            const SizedBox(height: 10),
            Text(
              "\$${product.price.toString()}",
              style: productPriceText(16),
            ),
            const SizedBox(height: 8),
            Text(
              "Brand  : ${product.brand}",
              style:  productDispritionText(),
            ),
            const SizedBox(height: 8),
            Text(
              "Unit  : ${product.unit}",
              style:  productDispritionText(),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style:  productDispritionText(),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.star, color: orangeColor, size: 20),
                const SizedBox(width: 5),
                Text(
                  product.rating.toString(),
                  style: productReviewText(16)
                ),
            const     SizedBox(width: 12),
                Text(
                  "(${product.reviews!.length} reviews)",
                  style:productFadeText(16)
                ),
              ],
            ),
          

        product.reviews!.isEmpty?const SizedBox.shrink():  const    SizedBox(height: 12),

          product.reviews!.isEmpty?const SizedBox.shrink():   Text(
              "Reviews:",
              style: titleStyle(),
            ),
            const SizedBox(height: 8),
            Column(
              children: product.reviews!.map<Widget>((review) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                  const     Icon(Icons.person, color: greyColor, size: 24),
                     const  SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(review.rating, (index) {
                              return const Icon(
                                Icons.star,
                                color: orangeColor,
                                size: 16,
                              );
                            }),
                          ),
                        const    SizedBox(height: 5),
                          Text(
                            review.comment,overflow: TextOverflow.ellipsis,
                            style:titleStyleSmall(13) ,),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount: ${product.discount}%",
                  style:productDiscoundText(16),
                ),
                CustomButton(onPressed: () {
                  Get.back();
                },title: 'Add to Cart',),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
