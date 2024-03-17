import 'package:flutter/material.dart';
import 'package:notesapp/components/drawer_tile.dart';
import 'package:notesapp/screens/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(Icons.edit, size: 40),
          ),
          SizedBox(
            height: 25,
          ),
          DrawerTile(
            title: "H O M E",
            leading: Icon(Icons.home),
            ontap: () {
              Navigator.pop(context);
            },
          ),
          DrawerTile(
            title: "S E T T I N G S",
            leading: Icon(Icons.settings),
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettinsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
