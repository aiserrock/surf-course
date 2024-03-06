import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/widget/app_bar.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/widget/body.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/widget/bottom_bar.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      bottomNavigationBar: BottomBar(selectedItemColor: Theme.of(context).colorScheme.onPrimary),
      body: const Body(),
    );
  }
}
