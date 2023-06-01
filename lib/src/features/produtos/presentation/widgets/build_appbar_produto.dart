import 'package:cep/src/core/presentation/widgets/sollaris_app_bar.dart';
import 'package:flutter/material.dart';

class BuildAppBarProduto extends StatelessWidget
    implements PreferredSizeWidget {
  const BuildAppBarProduto({super.key});

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
              title: const Text(
                'Adicionar Produto',
                style: TextStyle(fontSize: 18),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 100);
}
