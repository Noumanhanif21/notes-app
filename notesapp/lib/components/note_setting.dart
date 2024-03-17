import 'package:flutter/material.dart';

class NoteSetting extends StatelessWidget {
  // final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  const NoteSetting({
    super.key,
    // required this.onEditTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          onDeleteTap!();
        },
        child: Container(
          height: 50,
          color: Theme.of(context).colorScheme.background,
          child: Center(
            child: Text(
              "Delete",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
