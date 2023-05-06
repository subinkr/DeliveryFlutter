import 'package:flutter/material.dart';
import 'package:untitled1/common/component/pagination_list_view.dart';
import 'package:untitled1/restaurant/component/restaurant_card.dart';
import 'package:untitled1/restaurant/provider/restaurant_provider.dart';
import 'package:untitled1/restaurant/view/restaurant_detail_screen.dart';

import '../../common/const/data.dart';

class RestaurantScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: restaurantProvider,
      itemBuilder: <RestaurantModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) =>
                    RestaurantDetailScreen(
                      id: model.id,
                    ),
              ),
            );
          },
          child: RestaurantCard.fromModel(
            model: model,
          ),
        );
      },
    );
  }
}
