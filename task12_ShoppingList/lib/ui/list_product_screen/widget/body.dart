import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/mock/mock_product_list.dart';
import 'package:surf_flutter_courses_template/style/strings.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/filter_sheet/filter_sheet.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/widget/loader.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/widget/product_list.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/widget/summary.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  SortType sortType = SortType.withoutSort;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _productListHeader(context),
              const SizedBox(height: 16),
              Expanded(
                child: dataForStudents.isEmpty == true
                    ? const Center(
                        child: Text(StringRes.thereIsNothingYet),
                      )
                    : ProductListWidget(sortType: sortType),
              ),
              const Divider(),
              const SummaryWidget(),
            ],
          ),
        ),
        if (isLoading) const Loader(),
      ],
    );
  }

  Widget _productListHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            StringRes.listPurchases,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        _sortButton(context),
      ],
    );
  }

  void _sortButtonTapped() async {
    final result = await showModalBottomSheet<SortType>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return FilterListScreen(
            products: dataForStudents,
            initialSortType: sortType,
          );
        });
    isLoading = true;
    setState(() {});
    /// иммитация длительной работы сортировки
    await Future<void>.delayed(const Duration(seconds: 1));
    if (result != null) {
      sortType = result;
      isLoading = false;
      setState(() {});
    }
  }

  Widget _sortButton(BuildContext context) {
    return InkWell(
      onTap: _sortButtonTapped,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Center(
              child: Icon(
                Icons.sort,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            if (sortType != SortType.withoutSort)
              Container(
                height: 8,
                width: 8,
                margin: const EdgeInsets.only(right: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
