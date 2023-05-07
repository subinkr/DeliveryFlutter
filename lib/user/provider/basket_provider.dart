import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/product/model/product_model.dart';
import 'package:untitled1/user/model/basket_item_model.dart';
import 'package:collection/collection.dart';
import 'package:untitled1/user/model/patch_basket_body.dart';
import 'package:untitled1/user/repository/user_me_repository.dart';

final basketProvider =
    StateNotifierProvider<BasketProvider, List<BasketItemModel>>(
  (ref) {
    final repository = ref.watch(userMeRepositoryProvider);
    return BasketProvider(
      repository: repository,
    );
  },
);

class BasketProvider extends StateNotifier<List<BasketItemModel>> {
  final UserMeRepository repository;

  BasketProvider({
    required this.repository,
  }) : super([]);

  Future<void> patchBasket() async {
    await repository.patchBasket(
      body: PatchBasketBody(
        basket: state.map(
          (e) => PatchBasketBodyBasket(
            productId: e.product.id,
            count: e.count,
          ),
        ).toList(),
      ),
    );
  }

  Future<void> addToBasket({
    required ProductModel product,
  }) async {
    final exists = state.firstWhereOrNull(
          (e) => e.product.id == product.id,
        ) !=
        null;

    if (exists) {
      state = state
          .map(
            (e) => e.product.id == product.id
                ? e.copyWith(
                    count: e.count + 1,
                  )
                : e,
          )
          .toList();
    } else {
      state = [
        ...state,
        BasketItemModel(
          product: product,
          count: 1,
        ),
      ];
    }
    await patchBasket();
  }

  Future<void> removeFromBasket({
    required ProductModel product,
    bool isDelete = false,
  }) async {
    final exists = state.firstWhereOrNull(
          (e) => e.product.id == product.id,
        ) !=
        null;

    if (!exists) {
      return;
    }

    final existingProduct = state.firstWhere(
      (e) => e.product.id == product.id,
    );

    if (existingProduct.count == 1 || isDelete) {
      state = state
          .where(
            (e) => e.product.id != product.id,
          )
          .toList();
    } else {
      state = state
          .map(
            (e) => e.product.id == product.id
                ? e.copyWith(
                    count: e.count - 1,
                  )
                : e,
          )
          .toList();
    }
    await patchBasket();
  }
}
