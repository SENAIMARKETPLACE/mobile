// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeCardProduto extends StatelessWidget {
  const HomeCardProduto({
    Key? key,
    required this.titleProduct,
    required this.urlImage,
    required this.price,
  }) : super(key: key);

  final String titleProduct;
  final String urlImage;
  final double price;

  bool isUrlValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri!.hasScheme && uri.hasAuthority;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130,
          height: 180,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromARGB(255, 220, 197, 226),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(isUrlValid(urlImage)
                        ? urlImage
                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzRGkvN9WVysP2_3AbXtdgTegy9mEELt2yFirxQymBg&s'),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                titleProduct,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('R\$ $price')
            ],
          ),
        ),
      ],
    );
  }
}
