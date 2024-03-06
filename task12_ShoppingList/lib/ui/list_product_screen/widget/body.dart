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
  SortType _sortType = SortType.withoutSort;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _ProductListHeader(
                sortType: _sortType,
                filterButtonCallback: _sortButtonTapped,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: dataForStudents.isEmpty
                    ? const Center(
                        child: Text(StringRes.thereIsNothingYet),
                      )
                    : ProductListWidget(sortType: _sortType),
              ),
              const Divider(),
              const SummaryWidget(),
            ],
          ),
        ),
        if (_isLoading) const Loader(),
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
            initialSortType: _sortType,
          );
        });
    _isLoading = true;
    setState(() {});

    /// иммитация длительной работы сортировки
    await Future<void>.delayed(const Duration(seconds: 1));
    if (result != null) {
      _sortType = result;
      _isLoading = false;
      setState(() {});
    }
  }
}

class _ProductListHeader extends StatelessWidget {
  const _ProductListHeader({
    required SortType sortType,
    required this.filterButtonCallback,
  }) : _sortType = sortType;

  final SortType _sortType;
  final VoidCallback filterButtonCallback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            StringRes.listPurchases,
            style: theme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        _SortButton(sortType: _sortType, context: context, onTap: () => () {} //_sortButtonTapped,
            ),
      ],
    );
  }
}

class _SortButton extends StatelessWidget {
  const _SortButton({
    required SortType sortType,
    required this.context,
    required this.onTap,
  }) : _sortType = sortType;

  final SortType _sortType;
  final BuildContext context;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            if (_sortType != SortType.withoutSort)
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
