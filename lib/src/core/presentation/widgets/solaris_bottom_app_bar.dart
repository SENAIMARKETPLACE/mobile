import 'package:cep/src/core/presentation/widgets/sollaris_app_bar.dart';
import 'package:flutter/material.dart';

class SollarisBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SollarisBottomAppBar({super.key, required this.subTitle, this.search});

  final String subTitle;
  final Widget? search;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: SollarisAppBar(
        bottomBar: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                subTitle,
                style: const TextStyle(fontSize: 18),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              actions: [
                search ?? const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 100);
}
