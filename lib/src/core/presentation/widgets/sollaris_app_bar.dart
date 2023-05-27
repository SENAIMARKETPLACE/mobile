import 'package:flutter/material.dart';

class SollarisAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SollarisAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 40,
            // height: 80,
            child: Image.asset(
              'assets/image/logo.png',
              // fit: BoxFit.fill,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Text('Sollaris')
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(53);
}