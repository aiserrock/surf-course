import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/products_model.dart';
import 'package:surf_flutter_courses_template/style/strings.dart';

enum SortType {
  withoutSort,
  alphabetFromA,
  alphabetToA,
  highToLowPrice,
  lowToHighPrice,
  typeFromA,
  typeToA
}

class FilterListScreen extends StatefulWidget {
  final List<ProductEntity> products;

  final SortType initialSortType;

  const FilterListScreen({
    super.key,
    required this.products,
    required this.initialSortType,
  });

  @override
  State<FilterListScreen> createState() => _FilterListScreenState();
}

class _FilterListScreenState extends State<FilterListScreen> {
  late SortType sortType;

  @override
  void initState() {
    super.initState();
    sortType = widget.initialSortType;
  }

  void _onSortTypeChanged(SortType? value) {
    if (value == null) return;
    sortType = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 24),
                child: Text(
                  StringRes.sort,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              _customRadioListButton(title: StringRes.withoutSort, value: SortType.withoutSort),
              const _Divider(),
              _byNameSection(context),
              const _Divider(),
              _byPriceSection(context),
              const _Divider(),
              _byTypeSection(context),
              const SizedBox(height: 40),
              _DoneButton(sortType: sortType),
              const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _byNameSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            StringRes.byName,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        _customRadioListButton(title: StringRes.byNameFromAToZ, value: SortType.alphabetFromA),
        _customRadioListButton(title: StringRes.bynameFromZToA, value: SortType.alphabetToA),
      ],
    );
  }

  Widget _byPriceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            StringRes.byPrice,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        _customRadioListButton(title: StringRes.byAge, value: SortType.lowToHighPrice),
        _customRadioListButton(title: StringRes.decreasing, value: SortType.highToLowPrice),
      ],
    );
  }

  Widget _byTypeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            StringRes.byType,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        _customRadioListButton(title: StringRes.byTypeFromAToZ, value: SortType.typeFromA),
        _customRadioListButton(title: StringRes.byTypeFromZToA, value: SortType.typeToA),
      ],
    );
  }

  Widget _customRadioListButton({
    required String title,
    required SortType value,
  }) {
    return RadioListTile(
      activeColor: Theme.of(context).colorScheme.onPrimary,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      value: value,
      groupValue: sortType,
      onChanged: _onSortTypeChanged,
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(),
    );
  }
}

class _DoneButton extends StatelessWidget {
  const _DoneButton({
    required this.sortType,
  });

  final SortType sortType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 335,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, sortType);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            StringRes.done,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondaryContainer),
          ),
        ),
      ),
    );
  }
}
