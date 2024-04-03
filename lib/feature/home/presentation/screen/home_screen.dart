import 'package:easy_cart/feature/home/presentation/screen/home_page.dart';
import 'package:easy_cart/feature/home/presentation/widget/bottom_nav_bar.dart';
import 'package:easy_cart/utils/extension/theme_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
    final color = ThemeExt(context).color;
    List<Widget> pages = [
      const HomePage(),
      Container(color: Colors.blue),
      Container(),
      Container(),
    ];
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, val, _) {
        return Scaffold(
          body: SafeArea(
            child: pages[selectedIndex.value],
          ),
          floatingActionButton: customFloatingButton(color),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: CustomBottonNav(
            selectIndex: selectedIndex.value,
            onTap: (p0) => selectedIndex.value = p0,
          ),
        );
      },
    );
  }

  FloatingActionButton customFloatingButton(ColorScheme color) {
    return FloatingActionButton(
      tooltip: 'Cart',
      backgroundColor: color.primary,
      shape: const CircleBorder(),
      onPressed: () {
        // push cart
      },
      child: const Icon(
        CupertinoIcons.bag_fill,
        color: Colors.white,
      ),
    );
  }
}
