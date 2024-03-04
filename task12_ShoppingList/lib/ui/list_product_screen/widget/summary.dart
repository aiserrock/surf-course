import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/mock/mock_product_list.dart';
import 'package:surf_flutter_courses_template/style/strings.dart';
import 'package:surf_flutter_courses_template/util/count_sale.dart';
import 'package:surf_flutter_courses_template/util/money_formatter.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final totalSale = countSale(dataForStudents: dataForStudents).totalSaleRub;
    final totalSalePercent =
        countSale(dataForStudents: dataForStudents).totalSalePercent.toString();
    final total = countSale(dataForStudents: dataForStudents).total;
    final totalPriceWithSale = countSale(dataForStudents: dataForStudents).totalPriceWithSale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(StringRes.inYourPurchase),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${dataForStudents.length.toString()} ${StringRes.products}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              '${splitBy(total)} ${StringRes.rub}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 11),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${StringRes.sale} $totalSalePercent%',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              '${totalSale == 0 ? ' ' : '- '}${splitBy(totalSale)} ${StringRes.rub}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 11),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(StringRes.summary),
            Text(
              '${splitBy(totalPriceWithSale)} ${StringRes.rub}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
