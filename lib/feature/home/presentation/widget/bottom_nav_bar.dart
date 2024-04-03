import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavModel {
  final String iconName;
  final IconData icon;
  // bool isSelected;

  BottomNavModel({
    required this.iconName,
    required this.icon,
    // required this.isSelected,
  });
}

List<BottomNavModel> bottomList = [
  BottomNavModel(
    iconName: 'Home',
    icon: CupertinoIcons.house,
    // isSelected: true,
  ),
  BottomNavModel(
    iconName: 'Category',
    icon: CupertinoIcons.cube_box,
    // isSelected: false,
  ),
  BottomNavModel(
    iconName: 'My order',
    icon: CupertinoIcons.bag_fill,
    // isSelected: false,
  ),
  BottomNavModel(
    iconName: 'Profile',
    icon: CupertinoIcons.person,
    // isSelected: false,
  ),
];

class CustomBottonNav extends StatelessWidget {
  const CustomBottonNav({
    super.key,
    required this.selectIndex,
    this.onTap,
  });

  final int selectIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      currentIndex: selectIndex,
      items: [
        ...List.generate(
          bottomList.length,
          (index) {
            final backet = bottomList[index];
            Color color = (index == selectIndex) ? Colors.black : Colors.grey;

            return BottomNavigationBarItem(
              icon: Icon(
                backet.icon,
                color: color,
              ),
              label: backet.iconName,
            );
          },
        ),
        // BottomNavigationBarItem(
        //     icon: Icon(CupertinoIcons.cube_box), label: 'category'),
        // BottomNavigationBarItem(
        //     icon: Icon(CupertinoIcons.bag_fill), label: 'My order'),
        // BottomNavigationBarItem(
        //     icon: Icon(CupertinoIcons.person), label: 'profile'),
      ],
    );
  }
}
