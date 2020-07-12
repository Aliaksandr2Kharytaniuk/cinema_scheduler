import 'package:cinema_scheduler/core/pages.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_pages_map.dart';

class BottomNavigationWidget extends StatefulWidget {
  final Iterable<Pages> pages;
  final int selectedIndex;
  final Function(int) onTappedFunction;

  const BottomNavigationWidget({
    @required this.pages,
    @required this.selectedIndex,
    @required this.onTappedFunction,
  });

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _createBottomNavigationBarItems(),
      iconSize: 26.0,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.selectedIndex,
      onTap: widget.onTappedFunction,
    );
  }

  List<BottomNavigationBarItem> _createBottomNavigationBarItems() {
    return widget.pages
      .map(
        (page) => BottomNavigationBarItem(
          icon: Icon(bottomNavigationPagesMap[page].icon),
          title: Text(bottomNavigationPagesMap[page].title),
        ),
      )
      .toList();
  }
}