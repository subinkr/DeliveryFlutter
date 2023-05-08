import 'package:flutter/cupertino.dart';
import 'package:untitled1/common/provider/pagination_provider.dart';

class PaginationUtils {
  static void paginate({
    required ScrollController controller,
    required PaginationProvider provider,
  }) {
    if (controller.offset > controller.position.maxScrollExtent * 8 / 10) {
      provider.paginate(
            fetchMore: true,
          );
    }
  }
}
