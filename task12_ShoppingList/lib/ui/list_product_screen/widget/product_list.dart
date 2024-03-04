import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/products_model.dart';
import 'package:surf_flutter_courses_template/mock/mock_product_list.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/filter_sheet/filter_sheet.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/widget/item_product.dart';
import 'package:surf_flutter_courses_template/util/sort_product.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    required this.sortType,
    super.key,
  });

  final SortType sortType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final item = getSortType(sortType)[index];
          return Column(
            children: [
              ItemProductWidget(
                item: item,
                isFirstItem:
                    (index == 0 || item.category != getSortType(sortType)[index - 1].category) &&
                        (sortType == SortType.typeToA || sortType == SortType.typeFromA),
              ),
            ],
          );
        },
        itemCount: dataForStudents.length,
      ),
    );
  }
}

List<ProductEntity> getSortType(SortType? value) {
  switch (value) {
    case SortType.highToLowPrice:
      return highToLowPrice(dataForStudents);
    case SortType.lowToHighPrice:
      return lowToHighPrice(dataForStudents);
    case SortType.alphabetFromA:
      return alphabetFromA(dataForStudents);
    case SortType.alphabetToA:
      return alphabetToA(dataForStudents);
    case SortType.typeFromA:
      return typeFromA(dataForStudents);
    case SortType.typeToA:
      return typeToA(dataForStudents);
    case SortType.withoutSort:
    default:
      return dataForStudents;
  }
}
