import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/style/theme.dart';
import 'package:surf_flutter_courses_template/ui/list_product_screen/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: mainThemeData,
      home: const ProductListScreen(),
    );
  }
}
