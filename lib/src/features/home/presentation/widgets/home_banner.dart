// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
    required this.nameCompany,
  }) : super(key: key);

  final String nameCompany;

  bool get isLength => nameCompany.length <= 9;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          height: 130,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: AssetImage(
                'assets/image/banner-home.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 130,
          width: 180,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Bem vindo,\n',
                style: const TextStyle(fontSize: 30, color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: isLength ? '$nameCompany!' : 'Empresa!',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
