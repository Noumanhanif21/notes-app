import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function()? ontap;

  DrawerTile({
    required this.title,
    required this.leading,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: leading,
        onTap: ontap,
      ),
    );
  }
}
