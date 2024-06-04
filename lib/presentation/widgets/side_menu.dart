import 'package:cuteapp/config/menu/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffolkey;
  const SideMenu({super.key, required this.scaffolkey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndexMenu=0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(  
      selectedIndex: selectedIndexMenu,
      onDestinationSelected: (value) {
        setState(() {
          selectedIndexMenu=value;
        });
        final index=appMenuItems[value];
        context.push(index.link);
        widget.scaffolkey.currentState?.closeDrawer();
      },
      children: [
      const Padding(
        padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
        child: Text('Menu'),
      ),
      ...appMenuItems
      .sublist(0,6)
      .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title))),

      const Padding(padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
      child: Divider(),),
       const Padding(
        padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
        child: Text('Home'),
      ),

       ...appMenuItems
      .sublist(6)
      .map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title)))
    ]);
  }
}