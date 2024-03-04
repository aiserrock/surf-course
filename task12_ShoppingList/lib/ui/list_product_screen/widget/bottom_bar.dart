import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/style/strings.dart';

class BottomBar extends StatelessWidget {
  final Color selectedItemColor;

  const BottomBar({
    super.key,
    required this.selectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedItemColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: StringRes.catalog,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: StringRes.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: StringRes.basket,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: StringRes.personal,
          ),
        ],
      ),
    );
  }
}
