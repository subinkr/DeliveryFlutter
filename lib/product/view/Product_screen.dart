import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled1/common/component/pagination_list_view.dart';
import 'package:untitled1/product/component/product_card.dart';
import 'package:untitled1/product/model/product_model.dart';
import 'package:untitled1/product/provider/product_provider.dart';
import 'package:untitled1/restaurant/view/restaurant_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginationListView<ProductModel>(
      provider: productProvider,
      itemBuilder: <ProductModel>(_, index, model) {
        return GestureDetector(
            onTap: () {
              context.goNamed(
                RestaurantDetailScreen.routeName,
                params: {
                  'rid': model.restaurant.id,
                },
              );
            },
            child: ProductCard.fromProductModel(model: model));
      },
    );
  }
}
