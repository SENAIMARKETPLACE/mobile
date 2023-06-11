import 'package:cep/src/core/presentation/widgets/sollaris_drawer.dart';
import 'package:flutter/material.dart';

class SollarisAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SollarisAppBar({
    Key? key,
    this.bottomBar,
  }) : super(key: key);

  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 189, 66, 201),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 40,
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
      flexibleSpace: bottomBar,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(53);
}
